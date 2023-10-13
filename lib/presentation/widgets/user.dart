import 'package:ai_client/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final UserEntity user;

  const UserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(user.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${user.id ?? ''}'),
            Text('Surname: ${user.surname ?? ''}'),
            Text('Email: ${user.email ?? ''}'),
          ],
        ),
      ),
    );
  }
}