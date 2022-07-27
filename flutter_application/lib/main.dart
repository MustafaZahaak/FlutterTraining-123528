import 'package:flutter/material.dart';
import 'package:flutter_application/Screen1.dart';
import 'package:flutter_application/Screen2.dart';

import 'BottomNavigationDemo.dart';
import 'ButtonPage.dart';
import 'DataTableDemo.dart';
import 'DrawerDemo.dart';
import 'HomeScreen.dart';
import 'ListTileDemo.dart';
import 'MyButtons.dart';
import 'Screen0.dart';
import 'SelectableText.dart';
import 'TabBar.dart';
import 'TabBar1.dart';
import 'WebView.dart';

void main() {
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
    home: Buttonpage(),


    routes: {
      'S0': (context) => Screen0(title: "Contact", msg:'Good Morning'),
      'S1': (context) => Screen1(title: 'Gallary'),
      'S2': (context) => Screen2(title: 'Camera')
    },
  ));
}
