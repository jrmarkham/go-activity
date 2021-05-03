part of 'ui_bloc.dart';

abstract class UIBlocEvent extends Equatable {
  const UIBlocEvent();
}

class UIBlocEventUpdate extends UIBlocEvent {
  final NavDisplay navDisplay;
  final int navIdx;
  UIBlocEventUpdate({this.navDisplay, this.navIdx});

  @override
  List<Object> get props => [navDisplay, navIdx];
}