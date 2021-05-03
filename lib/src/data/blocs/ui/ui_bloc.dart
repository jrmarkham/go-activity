import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:go_activity_app/src/globals.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UIBloc extends Bloc<UIBlocEvent, UIBlocState> {
  UIBloc() : super(UIBlocStateInitial(null));

  @override
  Stream<UIBlocState> mapEventToState(
    UIBlocEvent event,
  ) async* {
    if(event is UIBlocEventUpdate) {
      yield UIBlocStateUpdate(state,
          navDisplay: event.navDisplay ?? state.navDisplay,
          navIdx: event.navDisplay ?? state.navIdx
      );
    }

  }

  void updateNavDisplay(NavDisplay navDisplay, {int navIdx = 0}) => add
    (UIBlocEventUpdate(navDisplay: navDisplay, navIdx: navIdx));
}
