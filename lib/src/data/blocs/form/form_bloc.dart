import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:go_activity_app/src/data/mixins/form_validation.dart';
import 'package:go_activity_app/src/data/models/form_field_element.dart';
import 'package:go_activity_app/src/globals.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormBlocEvent, FormBlocState>
    with FormValidationMixin {
  FormBloc() : super(FormBlocInitial());

  @override
  Stream<FormBlocState> mapEventToState(
    FormBlocEvent event,
  ) async* {
    if (event is FormBlocEventInitForm) {
      yield FormBlocStateLoaded(
          allVerified: state.allVerified, formElements: event.formElements);
      state.formElements.forEach((FormFieldElementObject element) {
        element.dataElement.text =  element.startingValue;
        element.dataElement.addListener(() {
          add(FormBlocEventListenElement(element));
        });
        // =>
      });
    }

    if (event is FormBlocEventListenElement) {
      FieldState updateFieldState = FieldState.invalid;
      if (this.isFieldEmpty(event.formField.dataElement.text)) {
        updateFieldState = FieldState.empty;
      } else if (this.isFieldValid(
          event.formField.dataElement.text, event.formField.fieldType)) {
        updateFieldState = FieldState.valid;
      }

      final List<FormFieldElementObject> _update = List.from(state.formElements)
        ..replaceRange(event.formField.index, event
            .formField.index + 1, [event.formField.copyWith(fieldState: updateFieldState)]);

        yield FormBlocStateLoading(state);
        yield FormBlocStateLoaded(
            allVerified: !_update.any((FormFieldElementObject element) =>
            element.fieldState != FieldState.valid && element.requiredField),
            formElements: _update);


    }
  }

  void initBloc(List<FormFieldElementObject> formElements) {
    add(FormBlocEventInitForm(formElements));
  }
}
