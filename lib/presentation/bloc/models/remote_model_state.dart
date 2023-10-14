import 'package:ai_client/domain/entities/general.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

class RemoteModelsState extends Equatable {
  final List<dynamic> ? models;
  final int ? selected;
  final List<GeneralEntity> ? elements;
  final DioException ? error;
  
  const RemoteModelsState({this.models, this.selected, this.elements, this.error});
  
  @override
  List<Object?> get props => [models, selected, elements, error];

  RemoteModelsState copyWith({
    List<dynamic>? models,
    int? selected,
    List<GeneralEntity>? elements,
    DioException? error,
  }) {
    return RemoteModelsState(
      models: models ?? this.models,
      selected: selected ?? this.selected,
      elements: elements ?? this.elements,
      error: error ?? this.error,
    );
  }
}

class RemoteModelsLoading extends RemoteModelsState {
  const RemoteModelsLoading();
}

class RemoteModelsDone extends RemoteModelsState {
  const RemoteModelsDone(dynamic model) : super(models: model);
  const RemoteModelsDone.withDetails({
    required dynamic model,
    required int selected,
    required List<GeneralEntity> elements,
  }) : super(
          models: model,
          selected: selected,
          elements: elements,
        );
}

class RemoteModelsError extends RemoteModelsState {
  const RemoteModelsError(dynamic error) : super(error: error);
}