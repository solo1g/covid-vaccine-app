import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidvaccineapp/state_models/user_details_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import './navigation.dart';

// import './HomeScreen.dart';

class UserDetailsStepper extends StatefulWidget {
  static const routeName = "/userdetails";
  static int userDetailsPagesCount = 3;
  @override
  _UserDetailsStepperState createState() => _UserDetailsStepperState();
}

class _UserDetailsStepperState extends State<UserDetailsStepper> {
  // final _firestore = FirebaseFirestore.instance;
  // final _auth = FirebaseAuth.instance;
  CollectionReference ref;
  int _currentStep;
  String userEmail;
  List<bool> activeStates;
  Map<String, dynamic> combinedForm = {};
  bool _showSpinner = false;
  @override
  void initState() {
    // userEmail = _auth.currentUser.email;
    // ref = _firestore.collection("UserDetails");
    // ref.doc(userEmail).get().then((doc) {
    //   if (doc.exists) {
    //     _currentStep = doc.data()["regStepsDone"];
    //   }
    // });
    _currentStep = 0;
    activeStates = [true, false, false];
    super.initState();
  }

  Map<String, dynamic> getCombinedForm() {
    return combinedForm;
  }

  void addToCombinedForm(val) {
    combinedForm.addAll(val);
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
          addToCombinedForm: addToCombinedForm,
          getCombinedForm: getCombinedForm,
        ),
        isActive: activeStates[0],
      ),
      Step(
        state: _getState(1),
        title: Text("2"),
        content: UserDetailsPage2(
          nextStepCallback: nextStep,
          addToCombinedForm: addToCombinedForm,
          getCombinedForm: getCombinedForm,
        ),
        isActive: activeStates[1],
      ),
      Step(
        state: _getState(2),
        title: Text("3"),
        content: UserDetailsPage3(
          nextStepCallback: nextStep,
          addToCombinedForm: addToCombinedForm,
          getCombinedForm: getCombinedForm,
        ),
        isActive: activeStates[2],
      ),
    ];
  }

  void nextStep() {
    setState(() {
      if (_currentStep < activeStates.length - 1) {
        _currentStep++;
        activeStates[_currentStep] = true;
      } else {
        fetchData();
      }
    });
  }

  Future<void> fetchData() async {
    _showSpinner = true;
    await context.read<UserData>().updateData();
    _showSpinner = false;
    Navigator.pushReplacementNamed(context, NavigationHomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("User Details"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
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
      ),
    );
  }
}

class UserDetailsPage1 extends StatefulWidget {
  final nextStepCallback, getCombinedForm, addToCombinedForm;
  UserDetailsPage1(
      {this.nextStepCallback, this.getCombinedForm, this.addToCombinedForm});
  @override
  _UserDetailsPage1State createState() => _UserDetailsPage1State();
}

class _UserDetailsPage1State extends State<UserDetailsPage1> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
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
                  keyboardType: TextInputType.number,
                  validators: [
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.required()
                  ],
                  decoration: const InputDecoration(
                    labelText: "Height",
                    hintText: "Enter height in cm",
                  ),
                ),
                SizedBox(height: 4),
                FormBuilderTextField(
                  attribute: "weight",
                  keyboardType: TextInputType.number,
                  validators: [
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.required()
                  ],
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
              if (_formKey.currentState.saveAndValidate()) {
                widget.addToCombinedForm(_formKey.currentState.value);
                widget.nextStepCallback();
              }
            },
          )
        ],
      ),
    );
  }
}

class UserDetailsPage2 extends StatefulWidget {
  final nextStepCallback, getCombinedForm, addToCombinedForm;
  UserDetailsPage2(
      {this.nextStepCallback, this.getCombinedForm, this.addToCombinedForm});
  @override
  _UserDetailsPage2State createState() => _UserDetailsPage2State();
}

class _UserDetailsPage2State extends State<UserDetailsPage2> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderDropdown(
                    attribute: 'peopleContactCount',
                    decoration: const InputDecoration(
                      labelText: 'Number of people in contact with daily',
                    ),
                    // initialValue: 'Male',
                    hint: Text('Select number of people you meet daily'),
                    validators: [FormBuilderValidators.required()],
                    items: (() {
                      var list = List<String>.generate(19, (i) => "${i + 1}");
                      list.add("20+");
                      return list
                          .map((val) => DropdownMenuItem(
                                value: val,
                                child: Text('$val'),
                              ))
                          .toList();
                    }())),
                FormBuilderDropdown(
                    attribute: 'peopleHouseCount',
                    decoration: const InputDecoration(
                      labelText: 'People living in house',
                    ),
                    // initialValue: 'Male',
                    hint: Text('How many people do you live with?'),
                    validators: [FormBuilderValidators.required()],
                    items: (() {
                      var list = List<String>.generate(9, (i) => "${i + 1}");
                      list.add("10+");
                      return list
                          .map((val) => DropdownMenuItem(
                                value: val,
                                child: Text('$val'),
                              ))
                          .toList();
                    }())),
                FormBuilderDropdown(
                    attribute: 'publicTransportCount',
                    decoration: const InputDecoration(
                      labelText: 'Time used public transport in a week',
                    ),
                    // initialValue: 'Male',
                    hint: Text('Select transport usage in last week'),
                    validators: [FormBuilderValidators.required()],
                    items: (() {
                      var list = List<String>.generate(19, (i) => "${i + 1}");
                      list.add("20+");
                      return list
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text('$gender'),
                              ))
                          .toList();
                    }())),
                FormBuilderDropdown(
                    attribute: 'travel',
                    decoration: const InputDecoration(
                      labelText: 'Do you travel to work/school',
                    ),
                    // initialValue: 'Male',
                    hint: Text('Select'),
                    validators: [FormBuilderValidators.required()],
                    items: ["Daily", "Often", "Sometimes", "Not at all"]
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text('$gender'),
                            ))
                        .toList()),
              ],
            ),
          ),
          FlatButton(
            child: Text("Next"),
            onPressed: () {
              if (_formKey.currentState.saveAndValidate()) {
                widget.addToCombinedForm(_formKey.currentState.value);
                widget.nextStepCallback();
              }
            },
          )
        ],
      ),
    );
  }
}

class UserDetailsPage3 extends StatefulWidget {
  final nextStepCallback, getCombinedForm, addToCombinedForm;
  UserDetailsPage3(
      {this.nextStepCallback, this.getCombinedForm, this.addToCombinedForm});
  @override
  _UserDetailsPage3State createState() => _UserDetailsPage3State();
}

class _UserDetailsPage3State extends State<UserDetailsPage3> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool showSpinner;
  @override
  void initState() {
    showSpinner = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Select if you have or are.."),
            FormBuilder(
              key: _formKey,
              child: Column(children: [
                FormBuilderCheckboxGroup(
                  wrapSpacing: double.infinity,
                  attribute: "healthFactorList",
                  options: [
                    FormBuilderFieldOption(
                      child: Text("Covid-19 positive"),
                      value: "coivd19",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Covid-19 symptoms (dry cough or fever)"),
                      value: "covid19symptoms",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Been in contact with someone with Covid-19"),
                      value: "covid19contact",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Asthma"),
                      value: "asthma",
                    ),
                    FormBuilderFieldOption(
                      child: Text(
                          "Chronic kidney disease being treated with dialysis"),
                      value: "kidney",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Chronic liver disease"),
                      value: "liver",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Compromised immune system"),
                      value: "immunesystem",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Serious heart condition"),
                      value: "heart",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Chronic lung disease"),
                      value: "lungs",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Diabetes"),
                      value: "diabetes",
                    ),
                    FormBuilderFieldOption(
                      child: Text("HIV positive"),
                      value: "hiv",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Health worker"),
                      value: "healthworker",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Hypertension"),
                      value: "hypertension",
                    ),
                    FormBuilderFieldOption(
                      child: Text("Other chronic illness"),
                      value: "other",
                    ),
                  ],
                ),
                FormBuilderCheckbox(
                  attribute: "details_done",
                  initialValue: false,
                  leadingInput: false,
                  label: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'I have read and agree to the ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(color: Colors.blue),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     print('launch url');
                          //   },
                        ),
                      ],
                    ),
                  ),
                  validators: [
                    FormBuilderValidators.requiredTrue(
                      errorText:
                          'You must accept terms and conditions to continue',
                    ),
                  ],
                ),
              ]),
            ),
            FlatButton(
              child: Text("Next"),
              onPressed: () {
                if (_formKey.currentState.saveAndValidate()) {
                  setState(() {
                    showSpinner = true;
                  });
                  widget.addToCombinedForm(_formKey.currentState.value);
                  _firestore
                      .collection('UserDetails')
                      .doc(_auth.currentUser.email)
                      .set(
                        widget.getCombinedForm(),
                      );
                  setState(() {
                    showSpinner = false;
                  });
                  widget.nextStepCallback();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
