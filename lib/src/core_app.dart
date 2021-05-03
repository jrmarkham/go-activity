import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_activity_app/src/data/blocs/activities/activities_bloc.dart';
import 'package:go_activity_app/src/data/blocs/ui/ui_bloc.dart';
import 'package:go_activity_app/src/data/models/activity.dart';
import 'package:go_activity_app/src/globals.dart';
import 'package:go_activity_app/src/ui/widgets/activity_displays.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Activity App::::::: '),
      ),
      // BLOC // with activity list
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocBuilder<UIBloc, UIBlocState>(
                  bloc: _uiBloc,
                  builder: (BuildContext context, UIBlocState uiState) {

                    debugPrint('uiState.navDisplay ${uiState.navDisplay}');

                    switch (uiState.navDisplay) {
                      case NavDisplay.detail:
                      return Flexible(
                        fit: FlexFit.loose,
                        child: PageView.builder(
                            pageSnapping: true,
                            controller: PageController(
                              initialPage: uiState.navIdx,
                              viewportFraction: 1.0
                            ),
                            itemCount: _activityBloc.state.activities.length,
                            itemBuilder: (BuildContext context, int idx) {
                              final ActivityModel am = _activityBloc.state.activities[idx];
                              return activityPageDisplay(am);
                            }),
                      );
                      case NavDisplay.list:
                      default:
                        return Expanded(
                          child: ListView.builder(
                              itemCount: _activityBloc.state.activities.length,
                              itemBuilder: (BuildContext context, int idx) {
                                final ActivityModel am =
                                    _activityBloc.state.activities[idx];
                                return activityCardDisplay(am);
                              }),
                        );
                    }
                  }),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(50.0),
        child: IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            size: 100.0,
            color: Colors.blue,
          ),
          tooltip: 'add your own activity',
          onPressed: () => _uiBloc.updateNavDisplay(NavDisplay.detail),
        ),
      ),
    );
  }
}
