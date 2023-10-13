import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/domain/usecases/get_user.dart';
import 'package:ai_client/presentation/bloc/users/remote_user_event.dart';
import 'package:ai_client/presentation/bloc/users/remote_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteUsersBloc extends Bloc<RemoteUsersEvent,RemoteUsersState> {
  final GetUserUseCase _getUserUseCase;
  
  RemoteUsersBloc(this._getUserUseCase) : super(const RemoteUsersLoading()){
    on <GetUsers> (onGetUsers);
  }


  void onGetUsers(GetUsers event, Emitter < RemoteUsersState > emit) async {
    final dataState = await _getUserUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteUsersDone(dataState.data!)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteUsersError(dataState.error!)
      );
    }
  }
  
}