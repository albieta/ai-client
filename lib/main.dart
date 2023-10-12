import 'package:ai_client/features/list_elements/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DailyNews()
    );
  }
}

