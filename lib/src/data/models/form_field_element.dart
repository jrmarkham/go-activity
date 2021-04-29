import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_activity_app/src/globals.dart';


class FormFieldElementObject extends Equatable {
  final int index;
  final FieldType fieldType;
  final FieldState fieldState;
  final bool requiredField;
  final dynamic startingValue;
  final dynamic dataElement;

  FormFieldElementObject({
    @required this.index,
    @required this.fieldType,
    @required this.fieldState,
    @required this.requiredField,
    @required this.startingValue,
    @required this.dataElement});

  FormFieldElementObject copyWith({
    int index,
    FieldType fieldType,
    FieldState fieldState,
    bool requiredField,
    dynamic startingValue,
    dynamic dataElement

  }) =>  FormFieldElementObject(
        index: index ?? this.index,
        fieldType: fieldType ?? this.fieldType,
        fieldState: fieldState ?? this.fieldState,
        requiredField: requiredField ?? this.requiredField,
        startingValue: startingValue ?? this.startingValue,
        dataElement: dataElement ?? this.dataElement);

  @override
// TODO: implement props
  List<Object> get props =>
      [index, fieldType, fieldState, requiredField, dataElement];


}
//
//
// FormFieldElementObject emailFFEO(int idx,
//     {bool reqField = true, String startVal}) =>
//     FormFieldElementObject(
//         index: idx,
//         fieldType: FieldType.email,
//         fieldState: startVal?.isEmpty == true ? FieldState.empty : FieldState
//             .valid,
//         requiredField: reqField,
//         startingValue: startVal ?? '',
//         dataElement: TextEditingController());
//
// FormFieldElementObject displayNameFFEO(int idx,
//     {bool reqField = true, String startVal}) =>
//     FormFieldElementObject(
//         index: idx,
//         fieldType: FieldType.displayName,
//         fieldState: startVal?.isEmpty == true ? FieldState.empty : FieldState
//             .valid,
//         requiredField: reqField,
//         startingValue: startVal ?? '',
//         dataElement: TextEditingController());
