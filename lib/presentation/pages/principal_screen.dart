import 'package:ai_client/presentation/bloc/models/remote_model_bloc.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_state.dart';
import 'package:ai_client/presentation/pages/create_element.dart';
import 'package:ai_client/presentation/pages/drones_screen.dart';
import 'package:ai_client/presentation/pages/users_screen.dart';
import 'package:ai_client/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PrincipalScreen extends StatelessWidget {
  static const String route = Routes.principal;
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose an Option',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("LIST OF ELEMENTS"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UsersScreen.route);
              },
              child: const Text('Users'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(DronesScreen.route);
              },
              child: const Text('Drones'),
            ),
            const Text("CREATE ELEMENTS"),
            _buildBody(context)
          ],
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<RemoteModelsBloc,RemoteModelsState> (
      builder: (_,state) {
        if (state is RemoteModelsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteModelsError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteModelsDone) {
          return Column(
          children: [
            // Print models on the screen
            for (var index = 0; index < (state.models?.length ?? 0); index++) ...[
              ElevatedButton(
                onPressed: () {
                  state.selected = index;
                  Navigator.of(context).pushNamed(CreateElementScreen.route);
                },
                child: Text(state.models![index]['title'] ?? ''),
              ),
              const SizedBox(height: 20),
            ],
          ],
        );
        }
        return const SizedBox();
      },
    );
  }
}