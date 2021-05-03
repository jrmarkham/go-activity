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
  @override
  List<Object> get props => [];
}

class ActivitiesBlocEventRemove extends ActivitiesBlocEvent {

  @override
  List<Object> get props => [];
}