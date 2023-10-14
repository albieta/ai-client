// ignore_for_file: must_be_immutable

import 'package:ai_client/app/util/logger.dart';
import 'package:ai_client/domain/usecases/create_element.dart';
import 'package:ai_client/injection_container.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_bloc.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_state.dart';
import 'package:ai_client/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateElementScreen extends StatelessWidget {
  static const String route = Routes.createElement;
  String modelName = '';
  Map<String, dynamic> formData = {};

  CreateElementScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody() ,
    );
  }
  
  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
          'Create Element',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark, color: Colors.black),
            ),
          ),
        ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteModelsBloc,RemoteModelsState> (
      builder: (_,state) {
        if (state is RemoteModelsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteModelsError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteModelsDone) {
          logger.i("GOT HERE");
          modelName = state.models![state.selected!]['title'];
          return Column(
            children: [
              Text(
                modelName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildForm(state.models![state.selected!])
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  _buildForm(dynamic model) {
    Map<String, dynamic> properties = model['properties'];

    List<Widget> formFields = properties.entries.map((entry) {
      String fieldName = entry.key;
      Map<String, dynamic> fieldDetails = entry.value;

      Widget formField = const SizedBox.shrink();

      if (fieldDetails['type'] == 'string') {
        formField = TextFormField(
          decoration: InputDecoration(labelText: fieldName),
          onChanged: (value) {
            formData[fieldName] = value;
          },
        );
      } else if (fieldDetails['type'] == 'int') {
        formField = TextFormField(
          decoration: InputDecoration(labelText: fieldName),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            formData[fieldName] = int.tryParse(value) ?? 0;
          },
        );
      }

      return formField;
    }).toList();

    formFields.add(
      ElevatedButton(
        onPressed: () async {
          final createElementUseCase = sl<CreateElementUseCase>();

          await createElementUseCase.call(params: {
            'model': modelName.toLowerCase(),
            'requestBody': formData,
          });
        },
        child: const Text('Submit'),
      ),
    );

    return Column(
      children: formFields,
    );
  }
}
