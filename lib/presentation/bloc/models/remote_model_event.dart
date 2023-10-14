abstract class RemoteModelsEvent {
  const RemoteModelsEvent();
}

class GetModels extends RemoteModelsEvent {
  const GetModels();
}

class ChangeSelected extends RemoteModelsEvent {
  final int newSelected;
  
  const ChangeSelected(this.newSelected);

  List<Object> get props => [newSelected];
}
