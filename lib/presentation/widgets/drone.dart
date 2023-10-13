import 'package:ai_client/domain/entities/drone.dart';
import 'package:flutter/material.dart';

class DroneWidget extends StatelessWidget {
  final DroneEntity drone;

  const DroneWidget({
    Key? key,
    required this.drone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(drone.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${drone.name ?? ''}'),
            Text('Model: ${drone.model ?? ''}'),
          ],
        ),
      ),
    );
  }
}