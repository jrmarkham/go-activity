import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_activity_app/src/data/models/activity.dart';

Widget activityCardDisplay(ActivityModel activityModel, Function
toggleDisplay) =>
    Card(
      shadowColor: Colors.black45,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.blue,
          width: 5.0,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListTile(
          contentPadding: const EdgeInsets.all(10.0),
          //  leading: CIRCLE IMAGE
          title: _getTitle(activityModel.title),


      // subtitle: _getEnemyUserDisplay(warData.enemyUser),
      onTap: toggleDisplay,
      // trailing: warData.actionOpen
      //     ? Padding(
      //   padding: EdgeInsets.all(corePadding),
      //   child: Icon(iconStar, color: colorMain, size: iconSize),
      // )
      //  ''    : null,
      )

    );

Widget activityPageDisplay(ActivityModel activityModel) =>
     Padding(
       padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
       child: Container(
         padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: activityModel.isUserActivity ? Colors.red : Colors.blue,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _getTitle('${activityModel.title}  ${activityModel.id}'),
            ],


          ),

    ),
     );

AutoSizeText _getTitle(String title) =>
    AutoSizeText(
        title,
        style: TextStyle(fontSize: 50.0),
        maxLines: 2);