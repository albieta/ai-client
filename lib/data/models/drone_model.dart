import 'package:ai_client/domain/entities/drone.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drone_model.g.dart';

@JsonSerializable()
class DroneModel extends DroneEntity {
  const DroneModel({
    String ? id,
    String ? name,
    String ? model,
  }): super(
    id: id, 
    name: name,
    model: model,
  );

  factory DroneModel.fromJson(Map<String, dynamic> json) =>
      _$DroneModelFromJson(json);
  Map<String, dynamic> toJson() => _$DroneModelToJson(this);

  factory DroneModel.fromEntity(DroneEntity entity) {
    return DroneModel(
      id: entity.id,
      name: entity.name,
      model: entity.model
    );
  }
}
