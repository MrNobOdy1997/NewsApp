// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_app/screens/navigation_screens/favourites_screen.dart';
// import 'package:new_app/screens/navigation_screens/headlines_screen.dart';
// import 'package:new_app/screens/navigation_screens/settings%20screen.dart';
//
// import '../theme_controller/theme_service.dart';
// import '../theme_controller/themes.dart';
//
// class NavigationHome extends StatelessWidget {
//   const NavigationHome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       title: 'News World',
//       theme: Themes.light,
//       darkTheme: Themes.dark,
//       themeMode: ThemeService().theme,
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() {
//     return _MyHomePageState();
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: getBody(),
//       bottomNavigationBar: _showBottomNav(),
//     );
//   }
//
//
//
//   Widget _showBottomNav() {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.shifting,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.newspaper_sharp),
//           label: 'HeadLines',
//
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.star_outline_sharp),
//           label: 'Favourite',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           label: 'Settings',
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.green,
//       unselectedItemColor: Colors.grey,
//       onTap: _onTap,
//     );
//   }
//
//   void _onTap(int index) {
//     log("_selectedIndex== $_selectedIndex");
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   getBody() {
//     List<Widget> pages = [
//        Headlines(),
//        Favourites(),
//       const Settings(),
//     ];
//     return IndexedStack(
//       index: _selectedIndex,
//       children: pages,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/screens/navigation_screens/favourites_screen.dart';
import 'package:new_app/screens/navigation_screens/headlines_screen.dart';

import 'navigation_screens/settings screen.dart';

class NavigationHome extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<NavigationHome>{
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;
  int _lastIndex = 0;

  void _onItemTapped(int index) {
    if(index == 0) {
      _navigatorKey.currentState?.restorablePushNamed('/');
    } else if(index == 1) {
      _navigatorKey.currentState?.restorablePushNamed('/page1');
    } else if(index == 2) {
      _navigatorKey.currentState?.restorablePushNamed('/page2');
    }
    setState(() {
      _lastIndex = _selectedIndex;
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      WillPopScope(

        onWillPop:
            () async {
          if(_selectedIndex == 0) {
            SystemNavigator.pop();
          } else if (_navigatorKey.currentState!.canPop()) {
            _navigatorKey.currentState!.pop();
            setState(() {
              _selectedIndex = _lastIndex;
               _lastIndex = _selectedIndex;
            });
            return false;
          }
          return true;
        },
        child: Navigator(
            key: _navigatorKey,
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              WidgetBuilder builder;
              // Manage your route names here
              switch (settings.name) {
                case '/':
                  builder = (BuildContext context) => Headlines();
                  break;
                case '/page1':
                  builder = (BuildContext context) => Favourites();
                  break;
                case '/page2':
                  builder = (BuildContext context) => const Settings();
                  break;
                default:
                  throw Exception('Invalid route: ${settings.name}');
              }
              return MaterialPageRoute(
                builder: builder,
                settings: settings,
              );
            }
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HeadLines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
