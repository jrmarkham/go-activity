import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  }

  void getActivityData() => add(ActivitiesBlocEventLoad());

  void addUserActivity(ActivityModel activity) {}
  void updateUserActivity({@required int id, @required ActivityModel activity}) {}
  void removeUserActivity(int id) {}
}
