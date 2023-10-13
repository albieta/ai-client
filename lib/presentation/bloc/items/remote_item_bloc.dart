import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/domain/usecases/get_item.dart';
import 'package:ai_client/presentation/bloc/items/remote_item_event.dart';
import 'package:ai_client/presentation/bloc/items/remote_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteItemsBloc<T> extends Bloc<RemoteItemsEvent,RemoteItemsState<T>> {
  final GetItemUseCase<T> _getItemUseCase;
  
  RemoteItemsBloc(this._getItemUseCase) : super(RemoteItemsLoading()){
    on <GetItems> (onGetItems);
  }


  void onGetItems(GetItems event, Emitter < RemoteItemsState > emit) async {
    final dataState = await _getItemUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteItemsDone(dataState.data!)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteItemsError(dataState.error!)
      );
    }
  }
  
}