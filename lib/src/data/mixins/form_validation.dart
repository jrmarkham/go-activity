



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
      default: return true;
    }
  }

  bool _validTitle(String title) => title.trim().length >= getFieldMinLength
    (FieldType.title);

  bool _validDate(String date) => date.trim().length >= getFieldMinLength
    (FieldType.date);

  bool _validURL(String url) => url.trim().length >= getFieldMinLength
    (FieldType.imageUrl);

  bool _validDescription(String description) => description.trim().length >=
      getFieldMinLength (FieldType.description);

  bool validTitle(String title) => title.trim().length >= getFieldMinLength
    (FieldType.title);


 //  bool _validDisplayName(String displayName) {
 // // //   if(displayName.trim().length < )
 // //   return false;
 // //    return true;
 //  }
 //
 //
 //  //
 //  // bool _validEmailAddress(String email) {
 //  //   if(email == null) return false;
 //  //   return RegExp(_EMAIL_REG_EXP).hasMatch(email);
 //  // }
}