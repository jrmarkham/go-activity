part of 'ui_bloc.dart';

abstract class UIBlocState extends Equatable {
  final NavDisplay navDisplay;
  final int navIdx;

  UIBlocState(UIBlocState state, {NavDisplay navDisplay, int navIdx})
      : this.navDisplay = navDisplay ?? state?.navDisplay ?? NavDisplay.wait,
        this.navIdx = navIdx ?? state?.navIdx ?? 0;

  @override
  List<Object> get props => [navDisplay];
}

class UIBlocStateInitial extends UIBlocState {
  UIBlocStateInitial(UIBlocState state) : super(state);

  @override
  List<Object> get props => [];
}

class UIBlocStateUpdate extends UIBlocState {
  final UIBlocState state;
  final NavDisplay navDisplay;
  final int navIdx;
  UIBlocStateUpdate(this.state, {@required this.navDisplay, @required this.navIdx}) :
        super(state);

  @override
  List<Object> get props => [state, navDisplay, navIdx];
}


class UIBlocStateAddActivity extends UIBlocState {
  final UIBlocState state;
  final ActivityModel activityModel;
  UIBlocStateAddActivity(this.state, this.activityModel): super(state);

  @override
  List<Object> get props => [state, activityModel];
}

class UIBlocStateUpdateActivity extends UIBlocState {
  final UIBlocState state;
  final ActivityModel activityModel;
  UIBlocStateUpdateActivity(this.state, this.activityModel): super(state);

  @override
  List<Object> get props => [state, activityModel];
}

class UIBlocStateRemoveActivity extends UIBlocState {
  final UIBlocState state;
  final int id;
  UIBlocStateRemoveActivity(this.state, this.id): super(state);

  @override
  List<Object> get props => [state, id];
}