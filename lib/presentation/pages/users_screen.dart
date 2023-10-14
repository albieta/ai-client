import 'package:ai_client/presentation/bloc/users/remote_user_bloc.dart';
import 'package:ai_client/presentation/bloc/users/remote_user_state.dart';
import 'package:ai_client/presentation/widgets/element.dart';
import 'package:ai_client/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  static const String route = Routes.users;
  const UsersScreen({ Key? key }) : super(key: key);

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
          'Users',
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
    return BlocBuilder<RemoteUsersBloc,RemoteUsersState> (
      builder: (_,state) {
        if (state is RemoteUsersLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteUsersError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteUsersDone) {
          return ListView.builder(
           itemBuilder: (context,index){
            return ElementWidget(
              element: state.users![index] ,
            );
           },
           itemCount: state.users!.length,
         );
        }
        return const SizedBox();
      },
    );
  }
}
