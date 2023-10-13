import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/domain/usecases/get_drone.dart';
import 'package:ai_client/presentation/bloc/drones/remote_drone_event.dart';
import 'package:ai_client/presentation/bloc/drones/remote_drone_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteDronesBloc extends Bloc<RemoteDronesEvent,RemoteDronesState> {
  final GetDroneUseCase _getDroneUseCase;
  
  RemoteDronesBloc(this._getDroneUseCase) : super(const RemoteDronesLoading()){
    on <GetDrones> (onGetDrones);
  }


  void onGetDrones(GetDrones event, Emitter < RemoteDronesState > emit) async {
    final dataState = await _getDroneUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteDronesDone(dataState.data!)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteDronesError(dataState.error!)
      );
    }
  }
  
}