import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_app/controller/registration_controller.dart';

import '../main.dart';
import '../theme_controller/theme_service.dart';
import '../theme_controller/themes.dart';
import 'navigation_home.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  // @override
  // State<SignUpActivity> createState() => _SignUpActivityState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Register",
      // theme: defaultTargetPlatform == TargetPlatform.iOS
      //     ? kIOSTheme
      //     : kDefaultTheme,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: Scaffold(
          appBar: AppBar(
              title: const Text("Register")),
          backgroundColor: context.theme.backgroundColor,
          resizeToAvoidBottomInset: false,
          body: const SingleChildScrollView(
            child: SignUpActivityStatefulWidget(),
          )),
    );
  }
}

class SignUpActivityStatefulWidget extends StatefulWidget {
  const SignUpActivityStatefulWidget({Key? key}) : super(key: key);

  @override
  State<SignUpActivityStatefulWidget> createState() => _SignUpActivityState();
}

enum UserGender {
  nil,
  male,
  female,
}

class _SignUpActivityState extends State<SignUpActivityStatefulWidget> {
  final _regformKey = GlobalKey<FormState>();

  // TextEditingController firstName = TextEditingController();
  // TextEditingController lastName = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  // TextEditingController dob = TextEditingController();
  UserGender? _gender = UserGender.nil;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    RegistrationController regController = Get.put(RegistrationController());
    log("$_gender");
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _regformKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            //alignment: Alignment.,
            padding: const EdgeInsets.only(
                left: 50.0, top: 30.0, right: 50.0, bottom: 30.0),
            child: const Text(
              "Create A New Account",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
                left: 20.0, top: 3.0, right: 20.0, bottom: 5.0),
            child: TextFormField(
              // onChanged: regObx.firstNameChanged,
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
                FilteringTextInputFormatter.allow((RegExp("[a-zA-Z]")))
              ],
              controller: regController.firstName,
              style: const TextStyle(
                fontSize: 14.0,
                height: 1.0,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // icon: Icon(Icons.person),
                hintText: 'Enter your First name',
                labelText: 'First Name',
                //   errorText: "enter first name",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter First name';
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
                left: 20.0, top: 3.0, right: 20.0, bottom: 5.0),
            child: TextFormField(
              //  onChanged: regObx.lastNameChanged,
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
                FilteringTextInputFormatter.allow((RegExp("[a-zA-Z]")))
              ],
              controller: regController.lastName,
              style: const TextStyle(
                fontSize: 14.0,
                height: 1.0,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                //icon: Icon(Icons.person),
                hintText: 'Enter your Last name',
                labelText: 'Last Name',
                //  errorText: regObx.errorText.value,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Last name';
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
                left: 20.0, top: 3.0, right: 20.0, bottom: 5.0),
            child: TextFormField(
              //      onChanged: regObx.emailChanged,
              controller: regController.emailId,
              style: const TextStyle(
                fontSize: 14.0,
                height: 1.0,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                //icon: Icon(Icons.person),
                hintText: 'Enter your EmailId',
                labelText: 'Email Id',
                //            errorText: regObx.errorText.value,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter EmailId';
                } else if (regController.isEmailValid(value)) {
                  return null;
                }
                return "Enter a valid mail Id";
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
                left: 20.0, top: 3.0, right: 20.0, bottom: 5.0),
            child: TextFormField(
              //        onChanged: regObx.passwordChanged,
              controller: regController.password,
              style: const TextStyle(
                fontSize: 14.0,
                height: 1.0,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                //icon: Icon(Icons.person),
                hintText: 'Enter a Password',
                labelText: 'Password',
                //         errorText: regObx.errorText.value,
              ),
              maxLength: 20,
              obscureText: true,
              validator: (password) {
                // if (isPasswordValid(password!)) {
                if (password!.isEmpty) {
                  return 'Please enter a Password';
                } else if (password.length < 8 || password.length > 20) {
                  return ("Minimum characters is 8 and maximum is 20");
                } else {
                  if (regController.isPasswordValid(password)) {
                    return null;
                  } else {
                    return "A digit, lower & uppercase letter and a special symbol must be included";
                  }
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
                left: 20.0, top: 3.0, right: 20.0, bottom: 5.0),
            child: TextFormField(
              //         onChanged: regObx.confirmPwdChanged,
              controller: confirmPassword,
              obscureText: true,
              maxLength: 20,
              style: const TextStyle(
                fontSize: 14.0,
                height: 1.0,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Confirm Entered Password',
                labelText: 'Confirm Password',
                //        errorText: regObx.errorText.value,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm Password';
                } else if (value != regController.password.text) {
                  log("value: $value and password ${regController.password.text}");
                  return "password and confirm password mismatch";
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
                left: 20.0, top: 3.0, right: 20.0, bottom: 5.0),
            child: TextFormField(
              controller: regController.dateOfBirth,
              style: const TextStyle(
                fontSize: 14.0,
                height: 1.0,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                //icon: Icon(Icons.person),
                // icon: Icon(Icons.calendar_today),
                //        errorText: regObx.errorText.value,

                hintText: 'Enter Dob',
                labelText: 'Date of Birth',
              ),
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter dob';
                }
                return null;
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now());

                if (pickedDate != null) {
                  //  print(pickedDate);
                  String formattedDate =
                      DateFormat('dd, MMMM yyyy').format(pickedDate);
                  regController.dateOfBirth.text =
                      formattedDate; //set output date to TextField value.
                  //     regObx.dobChanged(formattedDate);
                } else {
                  if (kDebugMode) {
                    print("Date is not selected");
                  }
                }
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: RadioListTile<UserGender>(
                title: const Text('male'),
                value: UserGender.male,
                groupValue: _gender,
                activeColor: Colors.green,
                onChanged: (UserGender? value) {
                  setState(() {
                    _gender = value;
                    log("gender $_gender");
                    regController.gender.text = "male";
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<UserGender>(
                title: const Text('female'),
                value: UserGender.female,
                groupValue: _gender,
                activeColor: Colors.green,
                onChanged: (UserGender? value) {
                  setState(() {
                    _gender = value;
                    log("gender $_gender");
                    regController.gender.text = "female";
                  });
                },
              ),
            ),
          ]),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                  left: 20.0, top: 3.0, right: 20.0, bottom: 5.0),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  // It returns true if the form is valid, otherwise returns false
                  if (_regformKey.currentState!.validate()) {
                    log("inside if");
                    if (_gender == UserGender.nil) {
                      log("inside second if");
                      regController.showToast('Please select your gender');
                    }
                    else{
                      regController.addData();
                      Get.to( NavigationHome());
                    }
                  }
                },
              )),
        ],
      ),
    );
  }
}
