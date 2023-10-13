import 'package:ai_client/domain/entities/drone.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteDronesState extends Equatable {
  final List<DroneEntity> ? drones;
  final DioException ? error;
  
  const RemoteDronesState({this.drones,this.error});
  
  @override
  List<Object> get props => [drones!, error!];
}

class RemoteDronesLoading extends RemoteDronesState {
  const RemoteDronesLoading();
}

class RemoteDronesDone extends RemoteDronesState {
  const RemoteDronesDone(List<DroneEntity> drone) : super(drones: drone);
}

class RemoteDronesError extends RemoteDronesState {
  const RemoteDronesError(DioException error) : super(error: error);
}