import 'package:ai_client/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    String ? id,
    String ? name,
    String ? surname,
    String ? email,
  }): super(
    id: id, 
    name: name,
    surname: surname,
    email: email,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      surname: entity.surname,
      email: entity.email
    );
  }
}