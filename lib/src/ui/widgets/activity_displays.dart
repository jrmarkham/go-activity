

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_activity_app/src/data/models/activity.dart';

Widget activityCardDisplay(ActivityModel activityModel) => Card(
  shadowColor: Colors.black45,
  borderOnForeground: true,
  shape: StadiumBorder(
    side: BorderSide(
      color: activityModel.isUserActivity ? Colors.red : Colors.blue,
      width: 5.0,
    ),
  ),
  child: ListTile(
    contentPadding: const EdgeInsets.all(10.0),
   //  leading: CIRCLE IMAGE
    title: AutoSizeText(
      activityModel.title,
      maxFontSize: 20,
      maxLines: 2,

    )
    ),
    // subtitle: _getEnemyUserDisplay(warData.enemyUser),
    // onTap: loadWar,
    // trailing: warData.actionOpen
    //     ? Padding(
    //   padding: EdgeInsets.all(corePadding),
    //   child: Icon(iconStar, color: colorMain, size: iconSize),
   // )
   //  ''    : null,
 // ),

);

Widget activityPageDisplay(ActivityModel activityModel) => Container(


  child: Column(
    children: [
      AutoSizeText(
        activityModel.title,
        maxFontSize: 20,
        maxLines: 2,

      )
    ],


  ),

);