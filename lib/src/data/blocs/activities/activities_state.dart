part of 'activities_bloc.dart';

@immutable
abstract class ActivitiesBlocState extends Equatable {
  final List<ActivityModel> activities = [];

  @override
  List<Object> get props => [activities];
}

class ActivitiesBlocStateInit extends ActivitiesBlocState {}

class ActivitiesBlocStateLoaded extends ActivitiesBlocState {
  final List<ActivityModel> activities;
  ActivitiesBlocStateLoaded(this.activities);

  @override
  List<Object> get props => [activities];
}