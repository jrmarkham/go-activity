part of 'ui_bloc.dart';

abstract class UIBlocEvent extends Equatable {
  const UIBlocEvent();
}

class UIBlocEventUpdate extends UIBlocEvent {
  final NavDisplay navDisplay;
  final int navIdx;
  final ActivityModel activityModel;
  UIBlocEventUpdate({@required this.navDisplay, this.navIdx, this
      .activityModel});

  @override
  List<Object> get props => [navDisplay, navIdx, activityModel];
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
  final int idx;
  UIBlocEventRemoveActivity(this.idx);

  @override
  List<Object> get props => [idx];
}