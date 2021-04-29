part of 'activities_bloc.dart';

@immutable
abstract class ActivitiesBlocEvent {}

class ActivitiesBlocEventLoad extends ActivitiesBlocEvent {}

class ActivitiesBlocEventAdd extends ActivitiesBlocEvent {
  final ActivityModel activityModel;
  ActivitiesBlocEventAdd(this.activityModel);

}

class ActivitiesBlocEventUpdate extends ActivitiesBlocEvent {}

class ActivitiesBlocEventRemove extends ActivitiesBlocEvent {}