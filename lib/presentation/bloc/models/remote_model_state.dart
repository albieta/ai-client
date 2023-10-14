// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteModelsState extends Equatable {
  final List<dynamic> ? models;
  int ? selected;
  final DioException ? error;
  
  RemoteModelsState({this.models, this.error, this.selected});
  
  @override
  List<Object> get props => [models!, selected!, error!];
}

class RemoteModelsLoading extends RemoteModelsState {
  RemoteModelsLoading();
}

class RemoteModelsDone extends RemoteModelsState {
  RemoteModelsDone(dynamic model) : super(models: model);
}

class RemoteModelsError extends RemoteModelsState {
  RemoteModelsError(DioException error) : super(error: error);
}