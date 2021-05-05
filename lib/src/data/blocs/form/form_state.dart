part of 'form_bloc.dart';

abstract class FormBlocState extends Equatable {
  final bool allVerified = false;
  final List<FormFieldElementObject> formElements = [];

  @override
  List<Object> get props => [
    allVerified,
    formElements
  ];
}

// Maintains latest state //
class FormBlocStatePostState extends FormBlocState {
  final FormBlocState state;
  final bool allVerified;
  final List<FormFieldElementObject> formElement;

  FormBlocStatePostState(this.state)
      : allVerified = state.allVerified,
        formElement = state.formElements;

  @override
  List<Object> get props => [state];
}


class FormBlocInitial extends FormBlocState {
  @override
  List<Object> get props => [];
}

class FormBlocStateLoading extends FormBlocStatePostState {
  final FormBlocState state;
  FormBlocStateLoading(this.state):super(state);

  @override
  List<Object> get props => [state];
}

class FormBlocStateLoaded extends FormBlocState {
  final bool allVerified;
  final List<FormFieldElementObject> formElements;

  FormBlocStateLoaded(
      {@required this.allVerified, @required this.formElements});

  @override
  List<Object> get props => [allVerified, formElements];
}
