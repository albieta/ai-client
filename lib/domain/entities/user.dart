import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.id,
    this.name,
    this.surname,
    this.email,
  });

  final String? id;
  final String? name;
  final String? surname;
  final String? email;

  @override
  List < Object ? > get props {
    return [
      id,
      name,
      surname,
      email
    ];
  }
}