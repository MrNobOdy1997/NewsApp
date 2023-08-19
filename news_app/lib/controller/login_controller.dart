import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:new_app/database/user_database_helper.dart';
import 'package:new_app/screens/navigation_home.dart';

import '../screens/registration_activity.dart';

class LoginController extends GetxController{
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
super.onInit();
  }
  void checkUserExist() async {

  var status =   await UserDatabaseHelper.instance.getLogin(userNameController.text, passwordController.text);
if(status.isNotEmpty){
  showToast("Login Successful");
  Get.to( NavigationHome());
}
  else{
    showToast("Invalid username or password");
}
}

  void showToast(message) {
    Fluttertoast.showToast(
        msg: message,  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.BOTTOM,    // location
        timeInSecForIosWeb: 1  ,
      backgroundColor:Colors.green.shade300,// duration
    );

  }
}