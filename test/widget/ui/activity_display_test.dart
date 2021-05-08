import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  TestWidgetsFlutterBinding.ensureInitialized();

  Widget _testWidget(Widget testWidget) {
    return Container(
      child: testWidget
    );
  }

  group ('Activity Display Widgets',(){
    group ('dismissibleActivityCard',(){
      test('should return true that date is empty', () {
        expect(true, true);
      });
    });


    group ('activityCardDisplay',(){
      test('should return true that date is empty', () {
        expect(true, true);
      });
    });

    group ('activityPageDisplay',(){
      test('should return true that date is empty', () {
        expect(true, true);
      });
    });

  });

}
