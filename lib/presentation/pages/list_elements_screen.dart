import 'package:ai_client/presentation/bloc/elements/remote_elements_bloc.dart';
import 'package:ai_client/presentation/bloc/elements/remote_elements_state.dart';
import 'package:ai_client/presentation/widgets/element.dart';
import 'package:ai_client/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListElementsScreen extends StatelessWidget {
  static const String route = Routes.listElements;
  const ListElementsScreen({ Key? key }) : super(key: key);

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
          'List of elements',
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
    return BlocBuilder<RemoteElementsBloc,RemoteElementsState> (
      builder: (_,state) {
        if (state is RemoteElementsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteElementsError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteElementsDone) {
          return ListView.builder(
            itemBuilder: (context,index){
              return ElementWidget(
                element: state.elements![index] ,
              );
            },
            itemCount: state.elements!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
