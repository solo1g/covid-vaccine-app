import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserDetailsStepper extends StatefulWidget {
  @override
  _UserDetailsStepperState createState() => _UserDetailsStepperState();
}

class _UserDetailsStepperState extends State<UserDetailsStepper> {
  int _currentStep;
  List<bool> activeStates;
  @override
  void initState() {
    _currentStep = 0;
    activeStates = [true, false, false];
    super.initState();
  }

  StepState _getState(int idx) {
    if (idx == _currentStep)
      return StepState.editing;
    else if (idx < _currentStep)
      return StepState.complete;
    else
      return StepState.disabled;
  }

  List<Step> _getSteps() {
    return [
      Step(
        title: Text("1"),
        state: _getState(0),
        content: UserDetailsPage1(
          nextStepCallback: nextStep,
        ),
        isActive: activeStates[0],
      ),
      Step(
        state: _getState(1),
        title: Text("2"),
        content: UserDetailsPage2(
          nextStepCallback: nextStep,
        ),
        isActive: activeStates[1],
      ),
      Step(
        state: _getState(2),
        title: Text("3"),
        content: Text("To be added"),
        isActive: activeStates[2],
      ),
    ];
  }

  void nextStep() {
    setState(() {
      if (_currentStep < activeStates.length - 1) {
        _currentStep++;
        activeStates[_currentStep] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stepper(
          currentStep: _currentStep,
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              children: <Widget>[
                Container(
                  child: null,
                ),
                Container(
                  child: null,
                ),
              ],
            );
          },
          type: StepperType.horizontal,
          steps: _getSteps(),
        ),
      ),
    );
  }
}

class UserDetailsPage1 extends StatefulWidget {
  var nextStepCallback;
  UserDetailsPage1({this.nextStepCallback});
  @override
  _UserDetailsPage1State createState() => _UserDetailsPage1State();
}

class _UserDetailsPage1State extends State<UserDetailsPage1> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  attribute: 'name',
                  decoration: const InputDecoration(
                      labelText: 'Name', hintText: "Enter your name"),
                  validators: [FormBuilderValidators.required()],
                ),
                SizedBox(height: 4),
                FormBuilderTextField(
                  attribute: 'email',
                  decoration: const InputDecoration(
                      labelText: 'Email', hintText: "Enter your email"),
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ],
                ),
                SizedBox(height: 4),
                FormBuilderDropdown(
                  attribute: 'gender',
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                  ),
                  hint: Text('Select Gender'),
                  validators: [FormBuilderValidators.required()],
                  items: ["Male", "Female", "Other", "Rather not say"]
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text('$gender'),
                          ))
                      .toList(),
                ),
                SizedBox(height: 4),
                FormBuilderTextField(
                  attribute: "height",
                  decoration: const InputDecoration(
                    labelText: "Height",
                    hintText: "Enter height in cm",
                  ),
                ),
                SizedBox(height: 4),
                FormBuilderTextField(
                  attribute: "weight",
                  decoration: const InputDecoration(
                    labelText: "Weight",
                    hintText: "Enter weight in kg",
                  ),
                ),
                SizedBox(height: 4),
                FormBuilderDropdown(
                  attribute: 'blood',
                  decoration: const InputDecoration(
                    labelText: 'Blood type',
                  ),
                  hint: Text('What is your blood type'),
                  validators: [FormBuilderValidators.required()],
                  items: [
                    "Don't know",
                    "O+",
                    "O-",
                    "A+",
                    "A-",
                    "B+",
                    "B-",
                    "AB+",
                    "AB-",
                  ]
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text('$gender'),
                          ))
                      .toList(),
                ),
                SizedBox(height: 4),
                FormBuilderDropdown(
                  attribute: 'income',
                  decoration: const InputDecoration(
                    labelText: 'Income',
                  ),
                  hint: Text('Do you have a high, medium or low income'),
                  validators: [FormBuilderValidators.required()],
                  items: ["Low", "Medium", "High"]
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text('$gender'),
                          ))
                      .toList(),
                ),
                SizedBox(height: 4),
                FormBuilderDateTimePicker(
                  inputType: InputType.date,
                  attribute: 'birthdate',
                  decoration: const InputDecoration(
                    labelText: 'Birthdate',
                  ),
                  helpText: "Select date of birth",
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
          FormBuilderDropdown(
            attribute: 'smoker',
            decoration: const InputDecoration(
              labelText: 'Do you smoke?',
            ),
            hint: Text('Choose yes even if you quit'),
            validators: [FormBuilderValidators.required()],
            items: ["Yes", "No"]
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text('$gender'),
                    ))
                .toList(),
          ),
          SizedBox(height: 4),
          FormBuilderDropdown(
            attribute: 'drugs',
            decoration: const InputDecoration(
              labelText: 'Do you use recreational drugs?',
            ),
            hint: Text('Choose yes even if you quit.'),
            validators: [FormBuilderValidators.required()],
            items: ["Yes", "No"]
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text('$gender'),
                    ))
                .toList(),
          ),
          FlatButton(
            child: Text("Next"),
            onPressed: () {
              // if (_formKey.currentState.saveAndValidate()) {
              //   print(_formKey.currentState.value);
              //   var x = _formKey.currentState.value;
              //   _firestore.collection('data').doc(x["email"]).set(
              //     {
              //       "name": x["name"],
              //     },
              //     SetOptions(merge: true),
              //   );
              // } else {
              //   print("Invalid");
              // }
              widget.nextStepCallback();
            },
          )
        ],
      ),
    );
  }
}

class UserDetailsPage2 extends StatefulWidget {
  var nextStepCallback;
  UserDetailsPage2({this.nextStepCallback});
  @override
  _UserDetailsPage2State createState() => _UserDetailsPage2State();
}

class _UserDetailsPage2State extends State<UserDetailsPage2> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FormBuilder(key: _formKey, child: Column(children: [])),
          FlatButton(
            child: Text("Next"),
            onPressed: () {
              // if (_formKey.currentState.saveAndValidate()) {
              //   print(_formKey.currentState.value);
              //   var x = _formKey.currentState.value;
              //   _firestore.collection('data').doc(x["email"]).set(
              //     {
              //       "name": x["name"],
              //     },
              //     SetOptions(merge: true),
              //   );
              // } else {
              //   print("Invalid");
              // }
              widget.nextStepCallback();
            },
          )
        ],
      ),
    );
  }
}