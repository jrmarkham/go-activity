import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_activity_app/src/core_app.dart';
import 'package:go_activity_app/src/globals.dart';

Future<void> main() async {

  Globals.initGlobal().then((_) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
        if (kReleaseMode) exit(1);
      };

      runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Globals.title,
          home: MultiBlocProvider(providers: [
            // BlocProvider<UserBloc>(
            // //     create: (BuildContext context) => UserBloc()),
            // BlocProvider<UIBloc>(create: (BuildContext context) => UIBloc()),
            // BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
            // BlocProvider<GameServiceConnectBloc>(create: (BuildContext context) => GameServiceConnectBloc()),
            // BlocProvider<UserProfileBloc>(create: (BuildContext context) => UserProfileBloc()),
            // // BlocProvider<SoundBloc>(
            // //     create: (BuildContext context) => SoundBloc()),
            // BlocProvider<TimerBloc>(create: (BuildContext context) => TimerBloc()),
            //
            // BlocProvider<SharedPrefsBloc>(
            //     create: (BuildContext context) => SharedPrefsBloc())
          ],
              child: CoreApp())));
    });
  });
}