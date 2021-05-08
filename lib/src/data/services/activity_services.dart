import 'package:go_activity_app/src/data/models/activity.dart';
import 'package:go_activity_app/src/globals.dart';

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
          title: 'Let\'s Go to Egypt',
          date: 'October 25, 2007',
          location: 'Cairo, Egypt',
          description: EGYPT_DESCRIPTION,
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/egypt.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 1,
          title: 'School Halloween',
          date: 'October 31, 2019',
          location: 'Peck Slip, New York, NY USA',
          description: HALLOWEEN_DESCRIPTION,
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/halloween.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 2,
          title: 'Greece See the Ancient World',
          date: 'September 20, 2009',
          location: 'location',
          description: GREECE_DESCRIPTION,
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/greece.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 3,
          title: 'Visit Moscow Russia',
          date: 'On a Tuesday . . . ',
          location: 'Moscow, Russia',
          description: MOSCOW_DESCRIPTION,
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/moscow.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 4,
          title: 'New Zealand, Hang out in a Hobbit Hole',
          date: 'November 12, 2006',
          location: 'New Zealand',
          description: NEW_ZEALAND_DESCRIPTION,
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/newzealand'
              '.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 5,
          title: 'See Sunny Spain',
          date: 'March 21, 2010',
          location: 'Madrid, Spain',
          description: SPAIN_DESCRIPTION,
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/spain.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 6,
          title: 'Merry Ole England',
          date: 'September 12, 2002',
          location: 'Stone Henge England',
          description: STONE_HENGE_DESCRIPTION,
          imageUrl:'https://sandbox.markhamenterprises.com/go_app/england.jpg',
          isUserActivity: false)
    ];
  }
}
