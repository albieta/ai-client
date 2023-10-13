import 'package:ai_client/presentation/pages/drones_screen.dart';
import 'package:ai_client/presentation/pages/users_screen.dart';
import 'package:flutter/material.dart';


class PrincipalScreen extends StatelessWidget {
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UsersScreen()),
                );
              },
              child: const Text('Users'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DronesScreen()),
                );
              },
              child: const Text('Drones'),
            ),
          ],
        ),
      ),
    );
  }
}