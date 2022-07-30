import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Authentication/HomePage.dart';
import 'Authentication/NewAccount.dart';
import 'ExpansionPanelDemo.dart';
import 'ModelBottomSheetDemo.dart';
import 'Notifications.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'BackgroundImageDemo.dart';
import 'BottomNavigationDemo.dart';
import 'PaymentPage.dart';
import 'DataTableDemo.dart';
import 'DrawerDemo.dart';
import 'HomeScreen.dart';
import 'ListTileDemo.dart';
import 'MyButtons.dart';
import 'PizzaApp.dart';
import 'SICalculator.dart';
import 'Screen0.dart';
import 'SelectableText.dart';
import 'StackWidgetDemo.dart';
import 'TabBar.dart';
import 'TabBar1.dart';
import 'WebView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: HomeScreen(),
    // home: BottomNavigationDemo(),
    // home: TabBarDemo(),
    // home: TabBarDemo1(),
    // home: ListTileDemo(),
    // home: DrawerDemo(),
    // home: DataTableDemo(),
    // home: SelectableTextDemo(),
    // home: Buttonpage(),
    //  home: SICalculator(),
    // home: PizzaApp(),
    //  home: StackWidgetDemo(),
    //  home: BackgroundImageDemo(),
    //  home: BottomSheetDemo(),
    //  home: ExpansionPanelDemo(),
    //  home: Notifications(),
    //  home: NewAccount(),
    home: HomePage(),

    routes: {
      'S0': (context) => Screen0(title: "Contact", msg: 'Good Morning'),
      'S1': (context) => Screen1(title: 'Gallary'),
      'S2': (context) => Screen2(title: 'Camera')
    },
  ));
}
