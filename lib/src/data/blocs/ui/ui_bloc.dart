import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:go_activity_app/src/data/models/activity.dart';
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
          navIdx: event.navIdx ?? state.navIdx,
          activityModel: event.activityModel ?? state.activityModel
      );
    }

    if(event is UIBlocEventAddActivity) {
     yield UIBlocStateAddActivity(state, event.activityModel);
    }

    if(event is UIBlocEventUpdateActivity) {
     yield UIBlocStateUpdateActivity(state, event.activityModel);
    }


    if(event is UIBlocEventRemoveActivity) {
      yield UIBlocStateRemoveActivity(state, event.idx);
    }

  }

  void updateUI({@required NavDisplay navDisplay, int navIdx, ActivityModel activityModel})
    =>  add(UIBlocEventUpdate(navDisplay: navDisplay, navIdx: navIdx, activityModel: activityModel));

  void addActivity (ActivityModel activityModel) => add(UIBlocEventAddActivity(activityModel));
  void updateActivity (ActivityModel activityModel) => add (UIBlocEventUpdateActivity(activityModel));
  void removeActivity (int idx) => add(UIBlocEventRemoveActivity(idx));
}
