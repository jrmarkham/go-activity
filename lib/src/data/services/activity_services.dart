import 'package:go_activity_app/src/data/models/activity.dart';

abstract class BaseActivityServices {
  List<ActivityModel> getActivities();
}

class ActivityServices extends BaseActivityServices {
  // static singleton
  static final ActivityServices _instance = ActivityServices.internal();

  factory ActivityServices() => _instance;

  ActivityServices.internal();

  List<ActivityModel> getActivities() {
    return [
      ActivityModel(
          id: 0,
          title: 'title',
          date: 'date',
          location: 'location',
          description: 'description',
          imageUrl: 'imageUrl',
          isUserActivity: false),
      ActivityModel(
          id: 1,
          title: 'title',
          date: 'date',
          location: 'location',
          description: 'description',
          imageUrl: 'imageUrl',
          isUserActivity: false),
      ActivityModel(
          id: 2,
          title: 'title',
          date: 'date',
          location: 'location',
          description: 'description',
          imageUrl: 'imageUrl',
          isUserActivity: false),
      ActivityModel(
          id: 3,
          title: 'title',
          date: 'date',
          location: 'location',
          description: 'description',
          imageUrl: 'imageUrl',
          isUserActivity: false),
      ActivityModel(
          id: 4,
          title: 'title',
          date: 'date',
          location: 'location',
          description: 'description',
          imageUrl: 'imageUrl',
          isUserActivity: false),
      ActivityModel(
          id: 5,
          title: 'title',
          date: 'date',
          location: 'location',
          description: 'description',
          imageUrl: 'imageUrl',
          isUserActivity: false),
      ActivityModel(
          id: 6,
          title: 'title',
          date: 'date',
          location: 'location',
          description: 'description',
          imageUrl: 'imageUrl',
          isUserActivity: false)
    ];
  }
}
