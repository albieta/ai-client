abstract class RemoteElementsEvent {
  const RemoteElementsEvent();
}

class ChangeSelected extends RemoteElementsEvent {
  final int newSelected;
  final List<dynamic> ? models;
  
  const ChangeSelected(this.newSelected, this.models);

  List<Object?> get props => [newSelected, models];
}
