import 'package:equatable/equatable.dart';

class DroneEntity extends Equatable {
  const DroneEntity({
    this.id,
    this.name,
    this.model,
  });

  final String? id;
  final String? name;
  final String? model;

  @override
  List < Object ? > get props {
    return [
      id,
      name,
      model
    ];
  }
}
