import 'package:ai_client/app/config/app_colors.dart';
import 'package:ai_client/injection_container.dart';
import 'package:ai_client/presentation/bloc/drones/remote_drone_bloc.dart';
import 'package:ai_client/presentation/bloc/drones/remote_drone_event.dart';
import 'package:ai_client/presentation/bloc/items/remote_item_bloc.dart';
import 'package:ai_client/presentation/bloc/items/remote_item_event.dart';
import 'package:ai_client/presentation/bloc/users/remote_user_bloc.dart';
import 'package:ai_client/presentation/bloc/users/remote_user_event.dart';
import 'package:ai_client/presentation/pages/principal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteUsersBloc>(
          create: (context) => sl<RemoteUsersBloc>()..add(const GetUsers()),
        ),
        BlocProvider<RemoteDronesBloc>(
          create: (context) => sl<RemoteDronesBloc>()..add(const GetDrones()),
        ),
        BlocProvider<RemoteItemsBloc>(
          create: (context) => sl<RemoteItemsBloc>()..add(const GetItems()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const PrincipalScreen()
      )
    );
  }
}

