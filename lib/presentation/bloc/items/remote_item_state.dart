import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteItemsState<T> extends Equatable {
  final List<T> ? items;
  final DioException ? error;
  
  const RemoteItemsState({this.items,this.error});
  
  @override
  List<Object> get props => [items!, error!];
}

class RemoteItemsLoading<T> extends RemoteItemsState<T> {
  RemoteItemsLoading() : super();
}

class RemoteItemsDone<T> extends RemoteItemsState {
  const RemoteItemsDone(List<T> item) : super(items: item);
}

class RemoteItemsError<T> extends RemoteItemsState {
  const RemoteItemsError(DioException error) : super(error: error);
}