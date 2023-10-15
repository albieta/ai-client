import 'package:ai_client/domain/entities/general.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

class RemoteElementsState extends Equatable {
  final List<dynamic> ? models;
  final int ? selected;
  final List<GeneralEntity> ? elements;
  final DioException ? error;
  
  const RemoteElementsState({this.models, this.selected, this.elements, this.error});
  
  @override
  List<Object?> get props => [models, selected, elements, error];
}

class RemoteElementsLoading extends RemoteElementsState {
  const RemoteElementsLoading();
}

class RemoteElementsDone extends RemoteElementsState {
  const RemoteElementsDone(List<GeneralEntity> element, int selected, List<dynamic> model) : super(elements: element, selected: selected, models: model);
}

class RemoteElementsError extends RemoteElementsState {
  const RemoteElementsError(dynamic error) : super(error: error);
}