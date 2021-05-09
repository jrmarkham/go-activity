import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:go_activity_app/src/data/models/activity.dart';
import 'package:go_activity_app/src/data/services/activity_services.dart';
import 'package:meta/meta.dart';

part 'activities_event.dart';
part 'activities_state.dart';

class ActivitiesBloc extends Bloc<ActivitiesBlocEvent, ActivitiesBlocState> {
  ActivitiesBloc() : super(ActivitiesBlocStateInitial());

  final BaseActivityServices _activityServices = ActivityServices();

  @override
  Stream<ActivitiesBlocState> mapEventToState(
      ActivitiesBlocEvent event,
  ) async* {

     if(event is ActivitiesBlocEventLoad) {
      yield ActivitiesBlocStateLoaded(_activityServices.getActivities());
    }

    if(event is ActivitiesBlocEventAdd) {
      yield ActivitiesBlocStateLoading(state.activities);
      final List<ActivityModel> list  = state.activities;
      list.add(event.activity);
      yield ActivitiesBlocStateLoaded(list, idx: list.length -1);
    }

    if(event is ActivitiesBlocEventRemove) {
      yield ActivitiesBlocStateLoading(state.activities);
      final List<ActivityModel> list  = state.activities;

      list.removeAt(event.idx);
      yield ActivitiesBlocStateLoaded(list);
    }

    if(event is ActivitiesBlocEventUpdate) {
      yield ActivitiesBlocStateLoading(state.activities);
      final List<ActivityModel> list  = state.activities;
      final int idx = list.indexWhere((ActivityModel am) => am.id == event
          .activity.id);
      list.replaceRange(idx,idx+1, [event.activity]);
      yield ActivitiesBlocStateLoaded(list, idx: idx);
    }

  }

  void getActivityData() => add(ActivitiesBlocEventLoad());
  void addActivity(ActivityModel activity) => add(ActivitiesBlocEventAdd(activity));
  void updateActivity(ActivityModel activity) => add(ActivitiesBlocEventUpdate(activity));
  void removeActivity(int idx) => add(ActivitiesBlocEventRemove(idx));
}
