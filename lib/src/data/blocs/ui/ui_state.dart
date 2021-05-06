part of 'ui_bloc.dart';

abstract class UIBlocState extends Equatable {
  final NavDisplay navDisplay;
  final int navIdx;
  final ActivityModel activityModel;

  UIBlocState(UIBlocState state, {NavDisplay navDisplay, int navIdx,  ActivityModel activityModel})
      : this.navDisplay = navDisplay ?? state?.navDisplay ?? NavDisplay.wait,
        this.navIdx = navIdx ?? state?.navIdx ?? 0,
        this.activityModel = activityModel ?? state?.activityModel;

  @override
  List<Object> get props => [navDisplay, navIdx, activityModel];
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
  final ActivityModel activityModel;
  UIBlocStateUpdate(this.state, {@required this.navDisplay, @required this
      .navIdx,  this.activityModel}) :
        super(state);

  @override
  List<Object> get props => [state, navDisplay, navIdx, activityModel];
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
  final int idx;
  UIBlocStateRemoveActivity(this.state, this.idx): super(state);

  @override
  List<Object> get props => [state, idx];
}