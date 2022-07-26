import 'package:flutter/material.dart';
import 'package:flutter_application/Screen1.dart';
import 'package:flutter_application/Screen2.dart';

import 'HomeScreen.dart';
import 'MyButtons.dart';
import 'Screen0.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: {
      'S0': (context) => Screen0(title: "Contact", msg:'Good Morning'),
      'S1': (context) => Screen1(title: 'Gallary'),
      'S2': (context) => Screen2(title: 'Camera')
    },
  ));
}
