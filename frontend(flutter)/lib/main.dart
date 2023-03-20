import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:slep/Components/second_support_com.dart';
import 'package:slep/const/colors.dart';
import 'package:slep/const/icons.dart';
import 'package:slep/screen/aboutus.dart';
import 'package:slep/screen/onscreen.dart';
import 'package:slep/screen/privacy.dart';
import 'package:slep/screen/setting.dart';
import 'package:slep/screen/singin.dart';
import 'package:slep/screen/singup.dart';
import 'package:slep/screen/support.dart';
import 'package:slep/screen/weekday.dart';
import 'package:slep/screen/weektimatable.dart';
import 'screen/alert.dart';
import 'screen/home.dart';
import 'screen/support_link.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/services.dart';

import 'package:shirne_dialog/shirne_dialog.dart';









Future<void> main() async {

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(75, 154, 159, 175)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: MyDialog.navigatorKey,
      routes: {
        '/home': (context) => home(),
        '/aboutus': (context) => aboutus(),
        '/privacy': (context) => priacy(),
        '/supportlink': (context) => supportLink(mod: 'sd',)
      },
      title: 'SLEP',
      theme: ThemeData(
        
          backgroundColor: background, scaffoldBackgroundColor: background),
          
      home: onscreen(),

      
      
 
    );
    
    
  }
}

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  List<Widget> _buildScreens() {
    return [alert(), support(), home(),weekday(),setting()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: IconBadge(
            icon: Icon(Icons.notifications_none),
            itemCount:2,
            badgeColor: slep_blue,
            itemColor: Colors.white,
            hideZero: true,
            
          ),
        activeColorPrimary: nav_dark,
        inactiveColorPrimary: nav_light,
      ),
      PersistentBottomNavBarItem(
        icon: support_icon,
        activeColorPrimary: nav_dark,
        inactiveColorPrimary: nav_light,
      ),
      PersistentBottomNavBarItem(
        icon: home_icon,
        activeColorPrimary: nav_dark,
        inactiveColorPrimary: nav_light,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.table_view_rounded,size:30 ,),
        activeColorPrimary: nav_dark,
        inactiveColorPrimary: nav_light,
      ),
      PersistentBottomNavBarItem(
        icon: setting_icon,
        activeColorPrimary: nav_dark,
        inactiveColorPrimary: nav_light,
      ),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 1);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: shape_filling_white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        colorBehindNavBar: shape_filling_white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 100),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
