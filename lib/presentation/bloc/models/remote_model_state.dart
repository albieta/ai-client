// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

class RemoteModelsState extends Equatable {
  final List<dynamic> ? models;
  int ? selected;
  final DioException ? error;
  
  RemoteModelsState({this.models, this.selected, this.error});
  
  @override
  List<Object?> get props => [models, selected, error];

  RemoteModelsState copyWith({
    List<dynamic>? models,
    int? selected,
    DioException? error,
  }) {
    return RemoteModelsState(
      models: models ?? this.models,
      selected: selected ?? this.selected,
      error: error ?? this.error,
    );
  }
}

class RemoteModelsLoading extends RemoteModelsState {
  RemoteModelsLoading();
}

class RemoteModelsDone extends RemoteModelsState {
  RemoteModelsDone(dynamic model) : super(models: model);
}

class RemoteModelsError extends RemoteModelsState {
  RemoteModelsError(dynamic error) : super(error: error);
}