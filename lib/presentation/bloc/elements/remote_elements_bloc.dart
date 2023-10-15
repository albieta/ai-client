import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/domain/usecases/get_elements.dart';
import 'package:ai_client/presentation/bloc/elements/remote_elements_event.dart';
import 'package:ai_client/presentation/bloc/elements/remote_elements_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteElementsBloc extends Bloc<RemoteElementsEvent,RemoteElementsState> {
  final GetElementsUseCase _getElementsUseCase;
  
  RemoteElementsBloc(this._getElementsUseCase) : super(const RemoteElementsLoading()){
    on <ChangeSelected> (onChangeSelected);
  }

  void onChangeSelected(ChangeSelected event, Emitter < RemoteElementsState > emit) async {

    final elementsState = await _getElementsUseCase.call(
      params: {
        'model': event.models![event.newSelected]['title'].toLowerCase(),
        'jsonSchema': event.models![event.newSelected],
      },
    );

    if (elementsState is DataSuccess) {
      emit(
        RemoteElementsDone(elementsState.data!, event.newSelected, event.models!)
      );
    }

    if (elementsState is DataFailed) {
      emit(
        RemoteElementsError(elementsState.error!),
      );
    }
  }
}