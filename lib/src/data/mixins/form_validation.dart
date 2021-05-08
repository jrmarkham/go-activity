import 'package:go_activity_app/src/globals.dart';
import 'package:go_activity_app/src/globals/enums.dart';

mixin FormValidationMixin {

  bool isFieldEmpty(String field) => field?.isEmpty ?? true;

  bool isFieldValid(String field, FieldType type ){
    switch (type){
      case FieldType.title : return _validTitle(field);
      case FieldType.date: return _validDate(field);
      case FieldType.imageUrl : return _validURL(field);
      case FieldType.description: return _validDescription(field);
      case FieldType.location: return _validLocation(field);
      default: return true;
    }
  }

  bool _validTitle(String title) => getFieldMinLength(FieldType.title) < title.trim().length;

  bool _validDate(String date) => getFieldMinLength(FieldType.date) < date.trim().length;

  bool _validURL(String url) => getFieldMinLength(FieldType.imageUrl) < url.trim().length;

  bool _validDescription(String description) => getFieldMinLength(FieldType.description) < description.trim().length;

  bool _validLocation(String location) => getFieldMinLength(FieldType.location) < location.trim().length;
}