import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:new_app/controller/headlines_controller.dart';
import 'package:new_app/controller/settings_controller.dart';
import 'package:new_app/screens/login_page.dart';

import '../../theme_controller/theme_service.dart';
import '../navigation_home.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
            left: 20.0, top: 15.0, right: 20.0, bottom: 5.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () => {Get.to( const LoginPage())},
                  ),
                ),
                Container(padding: const EdgeInsets.only(
                left: 5.0, top: 15.0, right: 30.0, bottom: 5.0),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                ),

                // Row(
                //   children: [
                //     Center(
                //
                //       // child: ElevatedButton(
                //       //   child: const Text(
                //       //     'Change Theme',
                //       //     style: TextStyle(color: Colors.white),
                //       //   ),
                //       //   onPressed: ThemeService().switchTheme,
                //       // ),
                //     ),
                //   ],
                // )
              ],
            )
          ],
        ));
    // return Scaffold(
    //   child: Column(
    //     children: [
    //       Row(
    //         children: [
    //           GetBuilder<SettingsController>(
    //             builder: (controller) => Switch(
    //               value: controller.isDarkMode == true ? true : false,
    //               onChanged: (value) => controller.toggleDarkMode(),
    //               activeTrackColor: Colors.yellow,
    //               activeColor: Colors.red,
    //             ),
    //             init: SettingsController(),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
