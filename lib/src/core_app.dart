import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_activity_app/src/data/blocs/activities/activities_bloc.dart';
import 'package:go_activity_app/src/data/blocs/ui/ui_bloc.dart';
import 'package:go_activity_app/src/data/models/activity.dart';
import 'package:go_activity_app/src/globals.dart';
import 'package:go_activity_app/src/ui/widgets/activity_displays.dart';
import 'package:go_activity_app/src/ui/widgets/activity_form.dart';

class CoreApp extends StatefulWidget {
  @override
  _CoreAppState createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  UIBloc _uiBloc;
  ActivitiesBloc _activityBloc;

  @override
  void initState() {
    // init bloc for ui
    _uiBloc = BlocProvider.of<UIBloc>(context);
    _activityBloc = BlocProvider.of<ActivitiesBloc>(context)..getActivityData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UIBloc, UIBlocState>(
            bloc: _uiBloc,
            listener: (BuildContext context, UIBlocState state) {
              debugPrint('BlocListener UIBlocState ${state.toString()}');
              if (state is UIBlocStateAddActivity) {

                debugPrint('UIBlocStateAddActivity ${state.activityModel}');

                _activityBloc.addActivity(state.activityModel);
              }

              if (state is UIBlocStateRemoveActivity) {

                debugPrint('UIBlocStateRemoveActivity ${state.idx}');

                _activityBloc.removeActivity(state.idx);
              }

              if (state is UIBlocStateUpdateActivity) {

                debugPrint('UIBlocStateUpdateActivity ${state.activityModel}');

                _activityBloc.updateActivity(state.activityModel);
              }


            }),
        BlocListener<ActivitiesBloc, ActivitiesBlocState>(
            bloc: _activityBloc,
            listener: (BuildContext context, ActivitiesBlocState state) {

              debugPrint('BlocListener ActivitiesBlocState ${state.toString()}');

              if (state is ActivitiesBlocStateLoaded) {
                debugPrint('loaded');
                state.idx == null
                  ? _uiBloc.updateUI(navDisplay: NavDisplay.list)
                  : _uiBloc.updateUI(navDisplay: NavDisplay.detail, navIdx: state.idx);
              }
            }),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('::::::: Go Activity App :::::::'),
        ),
        // BLOC // with activity list
        body: BlocBuilder<UIBloc, UIBlocState>(
            bloc: _uiBloc,
            builder: (BuildContext context, UIBlocState uiState) {

              debugPrint('BlocBuilder UIBlocState ${uiState.toString()}');


              switch (uiState.navDisplay) {
                case NavDisplay.detail:
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _listButton(),
                      Flexible(
                        fit: FlexFit.loose,
                        child: PageView.builder(
                            pageSnapping: true,
                            controller: PageController(
                                initialPage: uiState.navIdx,
                                viewportFraction: 1.0),
                            itemCount: _activityBloc.state.activities.length,
                            itemBuilder: (BuildContext context, int idx) {
                              final ActivityModel am =
                                  _activityBloc.state.activities[idx];
                              final Function toggleRemove = () =>
                                  _uiBloc.removeActivity(idx);
                              final Function toggleUpdate = () =>
                                  _uiBloc.updateUI(navDisplay: NavDisplay
                                      .edit);

                              return activityPageDisplay(activityModel: am,
                                  toggleUpdate: toggleUpdate, toggleRemove: toggleRemove);
                            }),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 50.0,
                              color: Colors.blue,
                            ),
                            tooltip: 'add your own activity',
                            onPressed: () =>
                                _uiBloc.updateUI(navDisplay: NavDisplay.add),
                          ),
                        ),
                      ),
                    ],
                  );
                case NavDisplay.add:
                  final Function _submitAdd = (ActivityModel
                  activityModel) => _uiBloc.addActivity(activityModel);
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _listButton(),
                      Flexible(
                          fit: FlexFit.loose,
                          child: ActivityForm(_submitAdd,
                              newId: _activityBloc.state.activities.length))
                    ],
                  );
                case NavDisplay.edit:

                  final Function _submitUpdate = (ActivityModel activityModel) => _uiBloc.updateActivity(activityModel);

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _listButton(),
                      Flexible(
                          fit: FlexFit.loose,
                          child: ActivityForm(_submitUpdate, activityModel: uiState.activityModel))
                    ],
                  );

                case NavDisplay.list:
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: _activityBloc.state.activities.length,
                            itemBuilder: (BuildContext context, int idx) {
                              final ActivityModel am =
                                  _activityBloc.state.activities[idx];

                              final Function toggleDetails = () =>
                                  _uiBloc.updateUI(
                                      navDisplay: NavDisplay.detail,
                                      navIdx: idx);
                              if(am.isUserActivity) {
                                final Function toggleRemove = (DismissDirection direction) =>
                                    _uiBloc.removeActivity(idx);
                                return dismissibleActivityCard(activityModel:
                                am, toggleDisplay: toggleDetails,
                                    toggleRemove: toggleRemove);
                              }

                              return activityCardDisplay(activityModel: am,
                                  toggleDisplay: toggleDetails);
                            }),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 50.0,
                              color: Colors.blue,
                            ),
                            tooltip: 'add your own activity',
                            onPressed: () =>
                                _uiBloc.updateUI(navDisplay: NavDisplay.add),
                          ),
                        ),
                      ),
                    ],
                  );

                case NavDisplay.wait:
                default:
                  return Column(
                    children: [
                      Text('I am loading here'),
                      CircularProgressIndicator()
                    ],
                  );
              }
            }),
      ),
    );
  }

  Widget _listButton() => Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(
            Icons.list,
            size: 25.0,
            color: Colors.blue,
          ),
          tooltip: 'list',
          onPressed: () => _uiBloc.updateUI(navDisplay: NavDisplay.list),
        ),
      );
}
