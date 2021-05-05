part of 'form_bloc.dart';

abstract class FormBlocEvent extends Equatable {
  const FormBlocEvent();
}

class FormBlocEventInitForm extends FormBlocEvent {
  final List<FormFieldElementObject> formElements;
  FormBlocEventInitForm(this.formElements);

  @override
  List<Object> get props => [formElements];
}


class FormBlocEventListenElement extends FormBlocEvent {
  final FormFieldElementObject formField;
  FormBlocEventListenElement(this.formField);

  @override
  List<Object> get props => [formField];
}


class FormBlocEventCheckValidation extends FormBlocEvent {
  final String email;
  FormBlocEventCheckValidation(this.email);
  @override
  List<Object> get props => [email];
}



