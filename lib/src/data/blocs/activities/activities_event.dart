part of 'activities_bloc.dart';

@immutable
abstract class ActivitiesBlocEvent extends Equatable {}

class ActivitiesBlocEventLoad extends ActivitiesBlocEvent {
  @override
  List<Object> get props => [];
}

class ActivitiesBlocEventAdd extends ActivitiesBlocEvent {
  final ActivityModel activity;
  ActivitiesBlocEventAdd(this.activity);

  @override
  List<Object> get props => [activity];
}

class ActivitiesBlocEventUpdate extends ActivitiesBlocEvent {
  final ActivityModel activity;
  ActivitiesBlocEventUpdate(this.activity);

  @override
  List<Object> get props => [activity];
}

class ActivitiesBlocEventRemove extends ActivitiesBlocEvent {
  final int idx;
  ActivitiesBlocEventRemove(this.idx);

  @override
  List<Object> get props => [idx];
}