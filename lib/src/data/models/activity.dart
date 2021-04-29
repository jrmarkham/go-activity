import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ActivityModel extends Equatable {
  final int id;
  final String title;
  final String date; // would be a date time object
  final String location; // would it own object // wth address and lat/long
  final String description;
  final String imageUrl;
  final bool isUserActivity; //  (users activity or not for editing) // (border
  // color)

  ActivityModel(
      {@required this.id,
      @required this.title,
      @required this.date,
      @required this.location,
      @required this.description,
      @required this.imageUrl,
      @required this.isUserActivity});

  @override
  List<Object> get props => [id, title, date, location, description,
    imageUrl, isUserActivity];

}
