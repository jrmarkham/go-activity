import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_activity_app/src/data/blocs/ui/ui_bloc.dart';
import 'package:go_activity_app/src/data/models/activity.dart';
import 'package:go_activity_app/src/globals.dart';

void main() {
  group('UIBloc', () {
    final UIBlocState state = UIBlocStateInitial(null);

    final ActivityModel activityModelAdd = ActivityModel(
        id: 7,
        title: 'New Title',
        date: 'date',
        location: 'location',
        description: 'description',
        imageUrl: 'imageUrl',
        isUserActivity: true);

    final ActivityModel activityModelUpdate = ActivityModel(
        id: 7,
        title: 'Update Title',
        date: 'date',
        location: 'location',
        description: 'description',
        imageUrl: 'imageUrl',
        isUserActivity: true);

    group('update Events', () {
      blocTest('emits UIBlocStateUpdate when Update Event event is called with Nav update',
          build: () => UIBloc(),
          act: (bloc) =>  bloc.add(UIBlocEventUpdate(navDisplay: NavDisplay.list)),
          expect: () => [UIBlocStateUpdate(state,
                    navDisplay: NavDisplay.list, navIdx: 0, activityModel: null)
              ]);

      blocTest('emits UIBlocStateUpdate when Update Event event is called with Nav update and nav Index',
          build: () => UIBloc(),
          act: (bloc) => bloc.add(UIBlocEventUpdate(navDisplay: NavDisplay.detail, navIdx: 4)),
          expect: () => [UIBlocStateUpdate(state,
                    navDisplay: NavDisplay.detail,
                    navIdx: 4,
                    activityModel: null)
              ]);

      blocTest('emits UIBlocStateUpdate when Update Event event is called with Nav update and nav Index',
          build: () => UIBloc(),
          act: (bloc) => bloc.add(UIBlocEventUpdate(navDisplay: NavDisplay.detail, navIdx: 4)),
          expect: () => [UIBlocStateUpdate(state,
              navDisplay: NavDisplay.detail,
              navIdx: 4,
              activityModel: null)
          ]);
    });

    blocTest(
        'emits UIBlocStateAddActivity with activity data when Add Activity event is called with Activity data',
        build: () => UIBloc(),
        act: (bloc) => bloc.add(UIBlocEventAddActivity(activityModelAdd)),
        expect: () => [UIBlocStateAddActivity(state, activityModelAdd)]);

    blocTest(
        'emits UIBlocStateUpdateActivity with activity data when UpdateActivity event is called with Activity data',
        build: () => UIBloc(),
        act: (bloc) => bloc.add(UIBlocEventUpdateActivity(activityModelUpdate)),
        expect: () => [UIBlocStateUpdateActivity(state, activityModelUpdate)]);

    blocTest(
        'emits UIBlocStateRemoveActivity with index data when RemoveActivity event is called with index data',
        build: () => UIBloc(),
        act: (bloc) => bloc.add(UIBlocEventRemoveActivity(7)),
        expect: () => [UIBlocStateRemoveActivity(state, 7)]);
  });
}
