import 'dart:math';

import 'package:go_activity_app/src/data/models/activity.dart';
import 'package:go_activity_app/src/globals.dart';
import 'package:intl/intl.dart';
import 'package:random_date/random_date.dart';
import 'package:ultimate_data_generator/ultimate_data_generator.dart';

abstract class BaseActivityServices {
  List<ActivityModel> getActivities();
}

class ActivityServices extends BaseActivityServices {
  // static singleton
  static final ActivityServices _instance = ActivityServices.internal();

  factory ActivityServices() => _instance;

  ActivityServices.internal();

  final rnd = new Random();

  List<ActivityModel> getActivities() {
    final List<ActivityModel> list = [
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
          imageUrl:
              'https://sandbox.markhamenterprises.com/go_app/halloween.jpg',
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
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/england.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 7,
          title: 'Wanna Play Hockey',
          date: 'June 20, 2003',
          location: 'Hackensack, NJ',
          description: HOCKEY,
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/hockey.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 8,
          title: 'Wanna Flag Football',
          date: 'April 17, 2000',
          location: 'Troy Hills, NJ',
          description: FOOTBALL,
          imageUrl:
              'https://sandbox.markhamenterprises.com/go_app/football.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 9,
          title: 'Get your Blackbelt',
          date: 'August 9, 1991',
          location: 'College Park, MD',
          description: BLACK_BELT,
          imageUrl:
              'https://sandbox.markhamenterprises.com/go_app/blackbelt.jpg',
          isUserActivity: false),
    ];

    for (int i = 10; i < 70; i++) {
      list.add(_getRandomModel(i));
    }

    return list;
  }

  List<String> _titleFirstList = [
    "Cake",
    "Pie",
    "Hot-Dog",
    "Pizza",
    "Sushi",
    "Banana",
    "Great Beer",
    "Fine Wine",
    "Red Wine",
    "Steak",
    "Cheeseburger",
    "Toenail",
    "Finger",
    "Ballerinas",
    "Dancing Insect",
    "Angel",
    "Demon",
    "Devil",
    "Seraph",
    "Vampire",
    "Basketball",
    "Glass Door",
    "Football",
    "Hockey",
    "Baseball",
    "Clutch",
    "Bowling",
    "World",
    "Galaxy",
    "Sun",
    "Moon",
    "Venus",
    "Mercury",
    "Mars",
    "Saturn",
    "God",
    "Gods",
    "Goddesses",
    "Deities",
    "Super-Hero",
    "Boat",
    "Pillow",
    "Thumb",
    "Toe",
    "One Hour",
    "Two Hour",
    "Six Hour",
    "One Minute",
    "Two Minute",
    "Six Minute",
    "One Month",
    "Two Month",
    "Six Month",
    "One Week",
    "Two Week",
    "Three Week",
    "Great Green",
    "Orange",
    "Blue",
    "Grey",
    "Black Heart",
    "Great Bleeding",
    "Bleeding Heart",
    "Green",
    "Bright Orange",
    "Fart",
    "Elegant Banquet",
    "Sex Dwarf",
    "Sister Disco",
    "Weather Man",
    "Paint it Black",
    "Virtual",
    "Dark Blue",
    "Great Grey",
    "Black Heart",
    "Bleeding",
    "Frozen Heart",
    "Great Frozen",
    "Burn",
    "Civil",
    "Great",
    "Funny not Funny",
    "Sorry not Sorry",
    "Jungle",
    "Pumpkin",
    "Pencil",
    "Naughty",
    "Dirty Underwear",
    "Great Jungle",
    "Paper",
    "Cardboard",
    "The Glass House",
    "The Boys",
    "The Girls",
    "The Giants",
    "The Dragons",
    "The Giraffe",
    "The Ants",
    "The Aunts",
    "The Uncles",
    "The Cousins",
    "The Moms",
    "The Dads",
    "The Mothers",
    "The Fathers",
    "The Sisters",
    "The Brothers",
    "The Ponies",
    "The Horses",
    "The Unicorns",
    "The Plastic Men",
    "The Metal Men",
    "The Wooden Men",
    "The Plastic Women",
    "The Metal Women",
    "The Wooden Women",
    "The Roses",
    "The Box of Candies",
    "The Dandelions",
    "The Roast Beef Subs",
    "The Little Dogs",
    "The Ugly Cats",
    "The Yellow",
    "Dracula",
    "The Elves",
    "The Dwarves",
    "The Goblins",
    "The Pork",
    "The Steamed Vegetables",
    "The Vitamins",
    "The Blood",
    "The Salads",
    "The Electric Fences",
    "The Wooden Dolls",
    "The Long Necked Horses",
    "The Satin Pajamas",
    "The Silk Boxers",
    "The Red Velvet Cake",
    "The Wolf-Man",
    "The Bands",
    "The Environment",
    "The Doodles",
    "The Boxers",
    "The Kick Boxers",
    "The Hairless Cats",
    "The Dogs",
    "The Metal",
    "The Metal People",
    "The Ghosts",
    "The Vikings"
  ];

  List<String> _titleSecondList = [
    "Video Chat",
    "Party",
    "Pool Party",
    "Vacation",
    "Time",
    "Bonanza",
    "Festival",
    "Chat",
    "Club",
    "Picnic",
    "Ball",
    "Game",
    "Sport",
    "Tournament",
    "Crafting",
    "Recital",
    "Opera",
    "Show",
    "Story",
    "Market",
    "Store",
    "Hootenanny"
  ];

  ActivityModel _getRandomModel(int id) => ActivityModel(
      id: id,
      title: _randomTitle(),
      date: _randomDate(),
      location: PlacesGen.generateUSACityAndState(),
      description: LOREM_IPSUM,
      imageUrl: 'https://sandbox.markhamenterprises.com/go_app/image_$id.jpg',
      isUserActivity: false);

  String _randomTitle()  {
    final int titleOne = rnd.nextInt(_titleFirstList.length -1);
    final int titleTwo = rnd.nextInt(_titleSecondList.length -1);
    return '${_titleFirstList[titleOne]} ${_titleSecondList[titleTwo]}';
  }

  String _randomDate() {
    final DateTime randomDate = RandomDate.withRange(1968, 2020).random();
    final DateFormat formatter = DateFormat('MMMM d, y');
    return formatter.format(randomDate);
  }


}
