import 'package:ai_client/app/config/app_colors.dart';
import 'package:ai_client/injection_container.dart';
import 'package:ai_client/presentation/bloc/elements/remote_elements_bloc.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_bloc.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_event.dart';
import 'package:ai_client/presentation/pages/create_element.dart';
import 'package:ai_client/presentation/pages/list_elements_screen.dart';
import 'package:ai_client/presentation/pages/principal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<RemoteModelsBloc>(
          create: (context) => sl<RemoteModelsBloc>()..add(const GetModels()),
        ),
        BlocProvider<RemoteElementsBloc>(
          create: (context) => sl<RemoteElementsBloc>()
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
        ListElementsScreen.route: (context) => const ListElementsScreen(),
        CreateElementScreen.route: (context) => CreateElementScreen(),
      },
    );
  }
}
