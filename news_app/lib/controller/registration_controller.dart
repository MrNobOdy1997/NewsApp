import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:new_app/screens/navigation_home.dart';
import '../database/user_database_helper.dart';
import '../model/user_details_model.dart';

class RegistrationController extends GetxController {
  var userdata = <UserData>[].obs;
  late TextEditingController firstName ;
  late TextEditingController lastName ;
  late TextEditingController emailId ;
  late TextEditingController password ;
  late TextEditingController confirmPassword;
  late TextEditingController dateOfBirth ;
  late TextEditingController gender;
  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    emailId = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    dateOfBirth = TextEditingController();
    gender = TextEditingController();

   // _getData();
    super.onInit();
  }

  bool isPasswordValid(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }
  bool isEmailValid(String email) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void addData() async {
    log("dataaaa${firstName.text},${lastName.text},${emailId.text},${password.text},${dateOfBirth.text},${gender.text}");
    await UserDatabaseHelper.instance
        .insert(UserData(id:userdata.length, firstName:firstName.text, lastName: lastName.text, mailId:emailId.text, password:password.text, dob:dateOfBirth.text, gender:gender.text));
    userdata.insert(
        0, UserData(id:userdata.length, firstName:firstName.text, lastName: lastName.text, mailId:emailId.text, password:password.text, dob:dateOfBirth.text, gender:gender.text));
   showToast("User created successfully");

    //addTaskController.clear();
  }
  void showToast(message) {
    Fluttertoast.showToast(
        msg: message,  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER,    // location
        timeInSecForIosWeb: 1               // duration
    );

  }

  // RxnString errorText = RxnString(null);
  //
  // Rxn<Function()> submitFunc = Rxn<Function()>(null);
  //
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //
  // void nameValidations(String val) async {
  //   errorText.value = null;
  //   submitFunc.value = null;
  //   if (val.isNotEmpty) {
  //     if (lengthOK(val)) {
  //     }
  //   }
  // }
  //
  // void emailValidation(String val) async {
  //   errorText.value = null;
  //   submitFunc.value = null;
  //   no no no
  // }
  //
  // void passwordValidations(String val) async {
  //   if (validatePassword(val)) {
  //     errorText.value =
  //         'A digit, lower & uppercase letter and a special symbol must be included';
  //   } else {
  //     errorText.value = null;
  //   }
  // }
  //
  // void dobValidation(String val) async {
  //   if (val.isEmpty) {
  //     errorText.value = "choose date of birth";
  //   }
  // }
  //
  // void confirmPasswordValidation(String val) async {
  //   if (val.isNotEmpty && (confirmPassword == password)) {
  //     errorText.value = null;
  //   } else {
  //     errorText.value = "Passwords mismatch";
  //   }
  // }
  //
  // void genderValidation(String val) async {
  //   if (val.isEmpty) {
  //     errorText.value = "Choose a gender";
  //   }
  // }
  //
  // bool validatePassword(String value) {
  //   if(value.length <8 || value.length > 20){
  //     errorText.value = 'Minimum 8 characters and Maximum 20 characters';
  //   }
  //   String pattern =
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$';
  //   RegExp regExp = new RegExp(pattern);
  //
  //   return regExp.hasMatch(value);
  // }
  //
  // bool lengthOK(String val) {
  //   if (val.length > 20) {
  //     errorText.value = 'max 20 chars';
  //     return false;
  //   }
  //   return true;
  // }
  //
  // Future<bool> available(String val) async {
  //   await Future.delayed(
  //       const Duration(seconds: 1), () => print('Available query returned'));
  //
  //   if (val == "Sylvester") {
  //     errorText.value = 'Name Taken';
  //     return false;
  //   }
  //   return true;
  // }
  //
  // void firstNameChanged(String val) {
  //   firstName.value = val;
  //   log("firstName $firstName");
  // }
  //
  // void lastNameChanged(String val) {
  //   lastName.value = val;
  //   log("lastName $lastName");
  // }
  //
  // void emailChanged(String val) {
  //   emailId.value = val;
  //   log("emailId $emailId");
  // }
  //
  // void passwordChanged(String val) {
  //   password.value = val;
  //   log("password $password");
  // }
  //
  // void confirmPwdChanged(String val) {
  //   confirmPassword.value = val;
  //   log("confirmPassword $confirmPassword");
  // }
  //
  // void dobChanged(String val) {
  //   dateOfBirth.value = val;
  //   log("dateOfBirth $dateOfBirth");
  // }
  //
  // void genderChanged(String val) {
  //   gender.value = val;
  //   log("gender $gender");
  // }
  //
  // Future<bool> Function() submitFunction() {
  //   return () async {
  //     await Future.delayed(
  //         const Duration(seconds: 1), () => print('User account created'));
  //     return true;
  //   };
  // }
}
