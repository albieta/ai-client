import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/domain/usecases/get_models.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_event.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteModelsBloc extends Bloc<RemoteModelsEvent,RemoteModelsState> {
  final GetModelUseCase _getModelUseCase;
  
  RemoteModelsBloc(this._getModelUseCase) : super(RemoteModelsLoading()){
    on <GetModels> (onGetModels);
  }


  void onGetModels(GetModels event, Emitter < RemoteModelsState > emit) async {
    final dataState = await _getModelUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteModelsDone(dataState.data!)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteModelsError(dataState.error!)
      );
    }
  }
}
