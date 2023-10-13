import 'package:ai_client/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteUsersState extends Equatable {
  final List<UserEntity> ? users;
  final DioException ? error;
  
  const RemoteUsersState({this.users,this.error});
  
  @override
  List<Object> get props => [users!, error!];
}

class RemoteUsersLoading extends RemoteUsersState {
  const RemoteUsersLoading();
}

class RemoteUsersDone extends RemoteUsersState {
  const RemoteUsersDone(List<UserEntity> user) : super(users: user);
}

class RemoteUsersError extends RemoteUsersState {
  const RemoteUsersError(DioException error) : super(error: error);
}