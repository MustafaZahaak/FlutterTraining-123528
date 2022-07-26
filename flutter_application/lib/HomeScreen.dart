import 'package:flutter/material.dart';
import 'package:flutter_application/Screen0.dart';
import 'package:flutter_application/Screen1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Scrren"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('goto Scrren-0'),
            onPressed: () {
              Navigator.pushNamed(context, 'S0');
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Screen0(title: 'Setting');
              // }));
            },
          ),
          ElevatedButton(
            child: Text('goto Scrren-1'),
            onPressed: () {
              Navigator.pushNamed(context, 'S1');
            },
          ),
          ElevatedButton(
            child: Text('goto Scrren-2'),
            onPressed: () {
              Navigator.pushNamed(context, 'S2');
            },
          ),
        ],
      )),
    );
  }
}
