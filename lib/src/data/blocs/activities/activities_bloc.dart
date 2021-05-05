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

  }

  void getActivityData() => add(ActivitiesBlocEventLoad());

  void addActivity(ActivityModel activity) => add(ActivitiesBlocEventAdd(activity));
  void updateActivity(ActivityModel activity) {}
  void removeActivity(int id) {}
}
