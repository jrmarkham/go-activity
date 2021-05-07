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
      debugPrint('ActivitiesBlocEventAdd ${state.activities.toString()}');
      yield ActivitiesBlocStateLoading(state.activities);
      final List<ActivityModel> list  = state.activities;
      list.add(event.activity);

      debugPrint('ActivitiesBlocEventAdd new list : ${list.toString()}');
      yield ActivitiesBlocStateLoaded(list);
    }

    if(event is ActivitiesBlocEventRemove) {
      debugPrint('ActivitiesBlocEventRemove ${event.idx}');
      yield ActivitiesBlocStateLoading(state.activities);
      final List<ActivityModel> list  = state.activities;

      list.removeAt(event.idx);

      debugPrint('ActivitiesBlocEventAdd new list : ${list.toString()}');
      yield ActivitiesBlocStateLoaded(list);
    }

    if(event is ActivitiesBlocEventUpdate) {
      debugPrint('ActivitiesBlocEventUpdate ${event.activity}');
      yield ActivitiesBlocStateLoading(state.activities);
      final List<ActivityModel> list  = state.activities;
      final int idx = list.indexWhere((ActivityModel am) => am.id == event
          .activity.id);
      // g

      list.replaceRange(idx,idx+1, [event.activity]);


      debugPrint('ActivitiesBlocEventUpdate new list : ${list.toString()}');
      yield ActivitiesBlocStateLoaded(list, idx: idx);
    }

  }

  void getActivityData() => add(ActivitiesBlocEventLoad());
  void addActivity(ActivityModel activity) => add(ActivitiesBlocEventAdd(activity));
  void updateActivity(ActivityModel activity) => add(ActivitiesBlocEventUpdate(activity));
  void removeActivity(int idx) => add(ActivitiesBlocEventRemove(idx));
}
