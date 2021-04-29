



import 'package:go_activity_app/src/globals/enums.dart';

mixin FormValidationMixin {

  bool isFieldEmpty(String field) => field?.isEmpty ?? true;

  bool isFieldValid(String field, FieldType type ){
    switch (type){
    ///  case FieldType.displayName: return _validDisplayName(field);
     // case FieldType.email: return _validEmailAddress(field);
      default: return false;
    }
  }

  bool _validDisplayName(String displayName) {
 // //   if(displayName.trim().length < getFieldMinLength(FieldType.displayName))
 //   return false;
 //    return true;
  }


  //
  // bool _validEmailAddress(String email) {
  //   if(email == null) return false;
  //   return RegExp(_EMAIL_REG_EXP).hasMatch(email);
  // }
}