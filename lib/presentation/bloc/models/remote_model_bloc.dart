import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/app/util/logger.dart';
import 'package:ai_client/domain/usecases/get_elements.dart';
import 'package:ai_client/domain/usecases/get_models.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_event.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteModelsBloc extends Bloc<RemoteModelsEvent,RemoteModelsState> {
  final GetModelUseCase _getModelUseCase;
  final GetElementsUseCase _getElementsUseCase;
  
  RemoteModelsBloc(this._getModelUseCase, this._getElementsUseCase) : super(const RemoteModelsLoading()){
    on <GetModels> (onGetModels);
    on <ChangeSelected> (onChangeSelected);
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

  void onChangeSelected(ChangeSelected event, Emitter < RemoteModelsState > emit) async {
    if (state.selected != event.newSelected) {
      final elementsState = await _getElementsUseCase.call(
        params: {
          'model': state.models![event.newSelected]['title'].toLowerCase(),
          'jsonSchema': state.models![event.newSelected],
        },
      );

      if (elementsState is DataSuccess && elementsState.data!.isNotEmpty) {
        emit(
          RemoteModelsDone({state.models, event.newSelected, elementsState.data})
        );
      }

      if (elementsState is DataFailed) {
        emit(
          RemoteModelsError(elementsState.error!),
        );
      }
    }
  }

  
}