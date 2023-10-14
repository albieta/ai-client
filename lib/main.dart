import 'package:ai_client/app/config/app_colors.dart';
import 'package:ai_client/injection_container.dart';
import 'package:ai_client/presentation/bloc/drones/remote_drone_bloc.dart';
import 'package:ai_client/presentation/bloc/drones/remote_drone_event.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_bloc.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_event.dart';
import 'package:ai_client/presentation/bloc/users/remote_user_bloc.dart';
import 'package:ai_client/presentation/bloc/users/remote_user_event.dart';
import 'package:ai_client/presentation/pages/create_element.dart';
import 'package:ai_client/presentation/pages/drones_screen.dart';
import 'package:ai_client/presentation/pages/principal_screen.dart';
import 'package:ai_client/presentation/pages/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<RemoteUsersBloc>(
          create: (context) => sl<RemoteUsersBloc>()..add(const GetUsers()),
        ),
        BlocProvider<RemoteDronesBloc>(
          create: (context) => sl<RemoteDronesBloc>()..add(const GetDrones()),
        ),
        BlocProvider<RemoteModelsBloc>(
          create: (context) => sl<RemoteModelsBloc>()..add(const GetModels()),
        ),
      ],
      child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: '/',
      routes: {
        PrincipalScreen.route: (context) => const PrincipalScreen(),
        UsersScreen.route: (context) => const UsersScreen(),
        DronesScreen.route: (context) => const DronesScreen(),
        CreateElementScreen.route: (context) => CreateElementScreen(),
      },
    );
  }
}
