
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_app/screens/login_page.dart';
import 'package:new_app/theme_controller/theme_service.dart';
import 'package:new_app/theme_controller/themes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const NewsApp());
}

// final ThemeData kIOSTheme = ThemeData(
//   primarySwatch: Colors.green,
//   primaryColor: Colors.green[100],
// );
//
// final ThemeData kDefaultTheme = ThemeData(
//   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
//       .copyWith(secondary: Colors.green),
// );

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);
  static const String _title = "Sign In";

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      title: _title,// add this
      home:  const LoginPage(),
    );
  }
}



// //////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////
























// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({
//     Key? key,
//   }) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   //final AnimationController animationController;
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with TickerProviderStateMixin {
//   int _selectedIndex = 0;
//   bool _visible = true;
//
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   final List<Widget> _widgetOptions = <Widget>[Home(), Business(), School()];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       // AppSettings.openAppSettings();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//
// class Business extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _Business();
// }
//
// class _Business extends State<Business> with TickerProviderStateMixin {
//   late AnimationController animation;
//   late Animation<double> _fadeInFadeOut;
//
//   @override
//   void initState() {
//     super.initState();
//     animation = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );
//     _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);
//
//     animation.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         //  animation.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         //  animation.forward();
//       }
//     });
//     animation.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FadeTransition(
//           opacity: _fadeInFadeOut,
//           child: Container(
//             color: Colors.green,
//             width: 100,
//             height: 100,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void deactivate() {
//     // TODO: implement deactivate
//     animation.reverse();
//     super.deactivate();
//   }
// }
//
// class School extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _School();
// }
//
// class _School extends State<School> with TickerProviderStateMixin {
//   late AnimationController animation;
//   late Animation<double> _fadeInFadeOut;
//
//   @override
//   void initState() {
//     super.initState();
//
//     animation = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );
//     _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);
//
//     animation.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         //    animation.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         //  animation.forward();
//       }
//     });
//     animation.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FadeTransition(
//           opacity: _fadeInFadeOut,
//           child: Column(
//             children: <Widget>[
//               MaterialButton(
//                 child: Text("Next Page"),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => nextPage()),
//                   );
//                 },
//                 color: Colors.red,
//               ),
//         Container(
//             color: Colors.green,
//             width: 100,
//             height: 100,
//           ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // @override
//   // void deactivate() {
//   //   // TODO: implement deactivate
//   //   animation.reverse();
//   //   super.deactivate();
//   // }
// }
//
// class nextPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Page 2"),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             MaterialButton(
//               child: Text("Go Back!"),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               color: Colors.red,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _Home();
// }
//
// class _Home extends State<Home> with TickerProviderStateMixin {
//   late AnimationController animation;
//   late Animation<double> _fadeInFadeOut;
//
//   @override
//   void initState() {
//     super.initState();
//     animation = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );
//     _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);
//
//     animation.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         //  animation.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         //  animation.forward();
//       }
//     });
//     animation.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FadeTransition(
//           opacity: _fadeInFadeOut,
//           child: Container(
//             color: Colors.green,
//             width: 100,
//             height: 100,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void deactivate() {
//     // TODO: implement deactivate
//     animation.reverse();
//     super.deactivate();
//   }
// }
