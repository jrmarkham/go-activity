part of 'ui_bloc.dart';

abstract class UIBlocState extends Equatable {
  final NavDisplay navDisplay;
  final int navIdx;

  UIBlocState(UIBlocState state, {NavDisplay navDisplay, int navIdx})
      : this.navDisplay = navDisplay ?? state?.navDisplay ?? NavDisplay.detail,
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
