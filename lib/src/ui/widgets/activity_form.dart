import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_activity_app/src/data/blocs/form/form_bloc.dart';
import 'package:go_activity_app/src/data/models/activity.dart';
import 'package:go_activity_app/src/data/models/form_field_element.dart';
import 'package:go_activity_app/src/globals.dart';
import 'package:intl/intl.dart';

class ActivityForm extends StatefulWidget {
  final Function submit;
  final int newId;
  final ActivityModel activityModel;

  ActivityForm(this.submit, {this.newId, this.activityModel});

  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final FormBloc _formBloc = FormBloc();
  bool _isNew;

  @override
  void initState() {
    _isNew = widget.activityModel == null;
    _formBloc.initBloc(
        _isNew ? _initNewActivity() : _initEditActivity(widget.activityModel));


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Function _submit = (ActivityModel activityModel) => widget.submit(activityModel);


    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 15.0),
          _isNew
              ? Text('Add Activity')
              : Text('Update Activity'),
          SizedBox(height: 15.0),
          Text(''),
          SizedBox(height: 15.0),
          BlocBuilder<FormBloc, FormBlocState>(
              bloc: _formBloc,
              builder: (BuildContext context, FormBlocState state) {
                debugPrint('State ${state.toString()}');

                return state.formElements.isNotEmpty
                    ? Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(height: 15.0),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.formElements.length,
                              itemBuilder: (BuildContext context, int idx) {
                                final FormFieldElementObject
                                _formElementObject = state.formElements[idx];

                                debugPrint(
                                    'PAGE ELEMENT: ${_formElementObject
                                        .fieldType} '
                                        '${_formElementObject.fieldState} '
                                        '${_formElementObject.dataElement
                                        .text}');

                                return _setFormField(_formElementObject);
                              }),
                          SizedBox(height: 15.0),
                          OutlinedButton(
                              child: Text('submit'),
                              onPressed: state.allVerified
                                  ? () =>
                                  _submit(_getActivity(state.formElements))
                                  : null,

                          )
                        ],
                      ),
                    ))
                    : CircularProgressIndicator();
              }),
        ],
      ),
    );
  }

  Widget inputTextField({@required TextEditingController con,
    @required int maxLen,
    @required int maxLines,
    @required String label,
    Function changedFunction,
    TextInputType input,
    String hintText,
    String errorText}) =>
      TextFormField(
        keyboardType: input == null ? TextInputType.text : input,
        controller: con,
        onChanged: changedFunction,
        maxLength: maxLen,
        maxLines: maxLines,
        textAlign: TextAlign.left,
        // style: bodyTextStyle(),
        decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            errorText: errorText,
            //   errorStyle: err,
            // hintStyle: bodyTextStyle(),
            // labelStyle: labelTextStyle(),
            // helperStyle: bodyTextStyle(),
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      );


  Widget _setFormField(FormFieldElementObject fieldElementObject) {
    final String _label = getFieldName(fieldElementObject.fieldType);
    final String _status = getStateText(fieldElementObject.fieldState, _label);
    final int _max = getFieldMaxLength(fieldElementObject.fieldType);
    final bool _hint = fieldElementObject.fieldState == FieldState.empty;
    final bool _error = fieldElementObject.fieldState == FieldState.invalid &&
        fieldElementObject.requiredField;
    return inputTextField(
        con: fieldElementObject.dataElement,
        input: TextInputType.text,
        label: _label,
        maxLen: _max,
        errorText: _error ? _status : null,
        hintText: _hint ? _status : null,
        maxLines: 1);
  }


  List<FormFieldElementObject> _initNewActivity() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM d, y');
    final String formattedDate = formatter.format(now);


    final List<FormFieldElementObject> _startingForm = [];
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.title, reqField: true));
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.date,
        reqField: true,
        startVal: formattedDate));
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.location, reqField: true));
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.description, reqField: true));
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.imageUrl, reqField: true));
    return _startingForm;
  }

  List<FormFieldElementObject> _initEditActivity(ActivityModel activityModel) {
    final List<FormFieldElementObject> _startingForm = [];
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.title,
        reqField: true,
        startVal: activityModel.title));
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.date,
        reqField: true,
        startVal: activityModel.date));
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.location,
        reqField: true,
        startVal: activityModel.location));
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.description, reqField: true, startVal:
        activityModel.description));
    _startingForm.add(formFieldElementObject(idx: _startingForm.length,
        fieldType: FieldType.imageUrl, reqField: true, startVal:
        activityModel.imageUrl));
    return _startingForm;
  }

  String _getFormElementDataFromListByType(List<FormFieldElementObject>
  list, FieldType type) {
    final FormFieldElementObject object = list.firstWhere(
            (FormFieldElementObject fieldElementObject) =>
        fieldElementObject.fieldType == type);
    return object.dataElement.text.trim();
  }


  ActivityModel _getActivity(List<FormFieldElementObject> list) =>
      ActivityModel(
        id: _isNew ? widget.newId : widget.activityModel.id,
        title: _getFormElementDataFromListByType(list, FieldType.title),
        date: _getFormElementDataFromListByType(list, FieldType.date),
        location: _getFormElementDataFromListByType(list, FieldType.location),
        description: _getFormElementDataFromListByType(
            list, FieldType.description),
        imageUrl: _getFormElementDataFromListByType(list, FieldType.imageUrl),
        isUserActivity: true
    );
}
