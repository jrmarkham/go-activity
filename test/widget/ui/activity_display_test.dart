import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_activity_app/src/ui/widgets/activity_displays.dart';
import 'package:go_activity_app/src/data/models/activity.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget _testWidget(Widget testWidget) {
    return MaterialApp(

      home: Scaffold(
        body:  Container(
        child: ListView(
            children: [
              testWidget
            ],
             )
      ),
    ));
  }

  Widget _testPageWidget(Widget testWidget) {
    return MaterialApp(

        home: Scaffold(
          body:  Container(
              child: PageView(
                children: [
                  testWidget
                ],
              )
          ),
        ));
  }


  group('Activity Display Widgets', () {
    group('dismissibleActivityCard', () {
      testWidgets('should find elements [titleText, Dismissible, Card, '
          'ListTile] of the dismissible activity card', (WidgetTester tester)
      async {

        final String titleText = 'title';
        final ActivityModel activityModel = ActivityModel(id: 07,
            title: titleText,
            date: 'date',
            location: 'location',
            description: 'description',
            imageUrl: 'imageUrlText',
            isUserActivity: true);

        Function toggleDisplay = ()=> null;
        Function toggleRemove = (DismissDirection direction)=> null;

        final Widget testDismissWidget = dismissibleActivityCard
          (activityModel: activityModel,  toggleDisplay:toggleDisplay,
            toggleRemove: toggleRemove);

        await tester.pumpWidget(_testWidget(testDismissWidget));
        final Finder titleFinder = find.text(titleText);
        expect(titleFinder, findsOneWidget);
        expect(find.byType(Dismissible), findsOneWidget);
        expect(find.byType(Card), findsOneWidget);
        expect(find.byType(ListTile), findsOneWidget);
        expect(find.byType(CircleAvatar), findsOneWidget);
      });
    });

    group('activityCard', () {
      testWidgets('should find elements [titleText,  Card, '
          'ListTile] of the activity card', (WidgetTester tester) async {

        final String titleText = 'title';
        final ActivityModel activityModel = ActivityModel(id: 07,
            title: titleText,
            date: 'date',
            location: 'location',
            description: 'description',
            imageUrl: 'imageUrlText',
            isUserActivity: true);

        Function toggleDisplay = ()=> null;

        final Widget testActivityWidget = activityCardDisplay(activityModel:
        activityModel,toggleDisplay:toggleDisplay);

        await tester.pumpWidget(_testWidget(testActivityWidget));
        final Finder titleFinder = find.text(titleText);
        expect(titleFinder, findsOneWidget);
        expect(find.byType(Card), findsOneWidget);
        expect(find.byType(ListTile), findsOneWidget);
        expect(find.byType(CircleAvatar), findsOneWidget);
      });
    });


    group('activityPage', () {
      testWidgets('should find elements [titleText, dateText, locationText, '
          'descriptionText, Column] of the activity page',
              (WidgetTester tester) async {

        final String titleText = 'title';
        final String dateText = 'date';
        final String locationText = 'location';
        final String descriptionText = 'description';
        final ActivityModel activityModel = ActivityModel(id: 07,
            title: titleText,
            date: dateText,
            location: locationText,
            description: descriptionText,
            imageUrl: 'imageUrlText',
            isUserActivity: true);

        Function toggleUpdate = ()=> null;
        Function toggleRemove = ()=> null;
        final Widget testActivityPageWidget = activityPageDisplay
          (activityModel: activityModel,toggleUpdate:toggleUpdate, toggleRemove: toggleRemove );

        await tester.pumpWidget(_testPageWidget(testActivityPageWidget));
        final Finder titleFinder = find.text(titleText);
        final Finder locationFinder = find.text(locationText);
        final Finder dateFinder = find.text(dateText);
        final Finder descriptionFinder = find.text(descriptionText);

        expect(titleFinder, findsOneWidget);
        expect(locationFinder, findsOneWidget);
        expect(dateFinder, findsOneWidget);
        expect(descriptionFinder, findsOneWidget);
        expect(find.byType(Column), findsOneWidget);
      });
    });
  });
}
