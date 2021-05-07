import 'package:go_activity_app/src/globals.dart';


// FORM FIELDS
// ENUM FUNCTIONS
String getFieldName(FieldType type){
  switch(type){
    case FieldType.date: return 'Date';
    case FieldType.imageUrl: return 'Image URL';
    case FieldType.location: return 'Location';
    case FieldType.description: return 'description';
    case FieldType.title:   return 'Title';
    default: return 'Field Name';
  }
}

int getFieldMaxLength(FieldType type){
  switch(type){
    case FieldType.date: return 50;
    case FieldType.imageUrl: return 100;
    case FieldType.location: return 100;
    case FieldType.description: return 250;
    case FieldType.title: default:  return 25;
  }
}


int getFieldMinLength(FieldType type){
  switch(type){

    case FieldType.date: return 10;
    case FieldType.imageUrl: return 10;
    case FieldType.location: return 10;
    case FieldType.description: return 15;
    case FieldType.title: default:  return 3;
  }
}

String getStateText(FieldState fieldState, String label) {
// TODO localization
  switch(fieldState){
    case FieldState.invalid: return 'Invalid $label';
    case FieldState.empty: return 'Enter $label';
    case FieldState.valid:default: return '$label valid';
  }
}