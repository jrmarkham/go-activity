import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_activity_app/src/core_app.dart';
import 'package:go_activity_app/src/data/blocs/activities/activities_bloc.dart';
import 'package:go_activity_app/src/data/blocs/ui/ui_bloc.dart';
import 'package:go_activity_app/src/globals.dart';

Future<void> main() async {
  Globals.initGlobal().then((_) {
      runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Globals.title,
          home: MultiBlocProvider(providers: [
            BlocProvider<UIBloc>(create: (BuildContext context) => UIBloc()),
            BlocProvider<ActivitiesBloc>(create: (BuildContext context) => ActivitiesBloc()),
          ], child:CoreApp())
            ));
    });
}