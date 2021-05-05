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

class UIBlocEventAddActivity extends UIBlocEvent {
  final ActivityModel activityModel;
  UIBlocEventAddActivity(this.activityModel);

  @override
  List<Object> get props => [activityModel];
}

class UIBlocEventUpdateActivity extends UIBlocEvent {
  final ActivityModel activityModel;
  UIBlocEventUpdateActivity(this.activityModel);

  @override
  List<Object> get props => [activityModel];
}

class UIBlocEventRemoveActivity extends UIBlocEvent {
  final int id;
  UIBlocEventRemoveActivity(this.id);

  @override
  List<Object> get props => [id];
}