import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_activity_app/src/data/models/activity.dart';
import 'package:go_activity_app/src/globals.dart';

Widget dismissibleActivityCard(
        {@required ActivityModel activityModel,
        @required Function toggleDisplay,
        @required Function toggleRemove}) =>
    Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      onDismissed: toggleRemove,
      child: activityCardDisplay(
          activityModel: activityModel, toggleDisplay: toggleDisplay),
    );

Widget activityCardDisplay(
        {@required ActivityModel activityModel,
        @required Function toggleDisplay}) =>
    Card(
        shadowColor: Colors.black45,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: activityModel.isUserActivity ? Colors.red : Colors.blue,
            width: 5.0,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10.0),
          //  leading: CIRCLE IMAGE
          title: _getTitle(activityModel.title),
          leading: CircleAvatar(
            child: _getImage(activityModel.imageUrl),
          ),

          onTap: toggleDisplay,
        ));

Widget activityPageDisplay(
        {@required ActivityModel activityModel,
        @required Function toggleUpdate,
        @required Function toggleRemove}) =>
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                _getImage(activityModel.imageUrl, width: 1000.0, height: 250.0),
                if (activityModel.isUserActivity)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 25.0,
                            color: Colors.green,
                          ),
                          onPressed: toggleUpdate),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 25.0,
                            color: Colors.red,
                          ),
                          onPressed: toggleRemove),
                    ],
                  ),
              ],
            ),
            _getTitle(activityModel.title),
            _getDate(activityModel.date),
            _getLocation(activityModel.location),
            SizedBox(height: 5.0),
            _getDescription(activityModel.description),
          ],
        ),
      ),
    );

AutoSizeText _getTitle(String title) =>
    AutoSizeText(title, style: TextStyle(fontSize: 50.0), maxLines: 1);

AutoSizeText _getDate(String date) =>
    AutoSizeText(date, style: TextStyle(fontSize: 20.0), maxLines: 1);

AutoSizeText _getLocation(String location) =>
    AutoSizeText(location, style: TextStyle(fontSize: 20.0), maxLines: 1);

Widget _getDescription(String description) => Expanded(
        child: Container(
      width: 1000.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
          child: Text(description, style: TextStyle(fontSize: 20))),
    ));

Widget _getImage(String url, {double width = 150, double height = 150}) {
  return FadeInImage(
    imageErrorBuilder:
        (BuildContext context, Object exception, StackTrace stackTrace) {
      print('Error Handler');
      return Container(
        width: width,
        height: height,
        child: Image.asset(goLogo),
      );
    },
    placeholder: AssetImage(goLogo),
    image: NetworkImage(url),
    fit: BoxFit.cover,
    width: width,
    height: height,
  );
}
