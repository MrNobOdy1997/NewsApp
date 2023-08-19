import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/screens/navigation_home.dart';
import 'package:new_app/screens/registration_activity.dart';
import '../controller/login_controller.dart';
import '../main.dart';
import '../theme_controller/theme_service.dart';
import '../theme_controller/themes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // @override
  // State<SignUpActivity> createState() => _SignUpActivityState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign In",
      // theme: defaultTargetPlatform == TargetPlatform.iOS
      //     ? kIOSTheme
      //     : kDefaultTheme,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: Scaffold(
        appBar:
            AppBar(title: const Text("Sign In"),
                backgroundColor: Colors.green
            ),backgroundColor: context.theme.backgroundColor,

        resizeToAvoidBottomInset: false,
        body: const LoginPageStatefulWidget(),
      ),
    );
  }
}

class LoginPageStatefulWidget extends StatefulWidget {
  const LoginPageStatefulWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageStatefulWidget> createState() => _LoginPageStatefulWidget();
}

class _LoginPageStatefulWidget extends State<LoginPageStatefulWidget> {
  final _loginformKey = GlobalKey<FormState>();
  LoginController loginObx = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _loginformKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(15, 120, 15, 30),
        children: <Widget>[
          Container(
            //alignment: Alignment.,
            padding: const EdgeInsets.only(
                left: 50.0, top: 10.0, right: 50.0, bottom: 20.0),
            child: const Text(
              "News World"
              " SignIn",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: loginController.userNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter emailId';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextFormField(
              obscureText: true,
              controller: loginController.passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 0.0),
            child: ElevatedButton(
              child: const Text("Sign In"),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => NavigationHome()),
                );
                // if(_loginformKey.currentState!.validate()){
                //   loginController.showToast("clicked login0");
                //   loginController.checkUserExist();
                // }
              },
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigator.of(context).push(
              //     loginObx.createRoute()
              // );
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const SignUpPage()),
              );
            },
            child: const Text(
              'Create new Account',
              style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
