import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_activity_app/src/data/mixins/form_validation.dart';
import 'package:go_activity_app/src/data/models/form_field_element.dart';
import 'package:go_activity_app/src/globals.dart';

class TestFormValidationMixin with FormValidationMixin {
  @override
  bool isFieldEmpty(String field) {
    return super.isFieldEmpty(field);
  }

  @override
  bool isFieldValid(String field, FieldType type) {
    // TODO: implement isFieldValid
    return super.isFieldValid(field, type);
  }
}

void main() {
  group(('Form Validation'), () {
    TestFormValidationMixin formValidationMixin;
    setUp(() {
      formValidationMixin = TestFormValidationMixin();
    });

    group('validate Title', () {
      test('should return true that title is empty', () {
        final String value = '';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testTitle = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.title,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldEmpty(testTitle.dataElement.text), true);
      });

      test('should return title validation is false', () {
        final String value = 'G';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testTitle = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.title,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(
                testTitle.dataElement.text, FieldType.title),
            false);
      });

      test('should return title validation is true', () {
        final String value = 'Good Title';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testTitle = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.title,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(
                testTitle.dataElement.text, FieldType.title),
            true);
      });
    });

    group('validate Date', () {
      test('should return true that date is empty', () {
        final String value = '';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testDate = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.date,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldEmpty(testDate.dataElement.text), true);
      });

      test('should return date validation is false', () {
        final String value = 'May';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testDate = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.date,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(
                testDate.dataElement.text, FieldType.date),
            false);
      });

      test('should return title validation is true', () {
        final String value = 'February 17, 2012';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testDate = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.date,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(
                testDate.dataElement.text, FieldType.date),
            true);
      });
    });

    group('validate ImageUrl', () {
      test('should return true that imageURL is empty', () {
        final String value = '';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testImageURL= FormFieldElementObject(
            index: 0,
            fieldType: FieldType.imageUrl,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldEmpty(testImageURL.dataElement.text), true);
      });

      test('should return imageURL validation is false', () {
        final String value = 'https://';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testImageURL = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.imageUrl,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(testImageURL.dataElement.text, FieldType.imageUrl),
            false);
      });

      test('should return imageURL validation is true', () {
        final String value =
            'https://sandbox.markhamenterprises.com/go_app/egypt.jpg';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testImageURL = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.imageUrl,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(testImageURL.dataElement.text,
                FieldType.imageUrl), true);
      });
    });

    group('validate Location', () {
      test('should return true that location is empty', () {
        final String value = '';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testLocation = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.location,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldEmpty(testLocation.dataElement.text), true);
      });

      test('should return location validation is false', () {
        final String value = 'Cairo';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testLocation = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.location,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(testLocation.dataElement.text, FieldType.location), false);
      });

      test('should return location validation is true', () {
        final String value = 'Cairo, Egypt';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testLocation = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.location,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(
                testLocation.dataElement.text, FieldType.location),
            true);
      });
    });

    group('validate Description', () {
      test('should return true that description is empty', () {
        final String value = '';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testDescription = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.description,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldEmpty(testDescription.dataElement.text),
            true);
      });

      test('should return description validation is false', () {
        final String value = 'Ca';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testDescription = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.description,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(
                testDescription.dataElement.text, FieldType.description),
            false);
      });

      test('should return description validation is true', () {
        final String value = 'Nearly 5,000 years ago, Memphis was the capital of Egypt and Giza served as the burial grounds for the royals. The three pyramid complexes were created in honor of their kings. The oldest of the Pyramids of Giza were built all the way back in 2613-2498 BC and there are so many different layers of meaning surrounding them.';
        final TextEditingController textEditingController =
            TextEditingController();
        textEditingController.text = value;
        final FormFieldElementObject testDescription = FormFieldElementObject(
            index: 0,
            fieldType: FieldType.description,
            fieldState: value.isEmpty ? FieldState.empty : FieldState.valid,
            requiredField: true,
            startingValue: value,
            dataElement: textEditingController);

        expect(
            formValidationMixin.isFieldValid(
                testDescription.dataElement.text, FieldType.description),
            true);
      });
    });
  });
}
