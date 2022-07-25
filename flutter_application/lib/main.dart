import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    // backgroundColor: Colors.blue[100],
    // appBar: AppBar(
    //   title: Text(
    //     'Application Title',
    //   ),
    //   centerTitle: true,
    //   backgroundColor: Colors.deepOrange,
    // ),
    body: SafeArea(
        child: Center(
      child: Image(
        // image: NetworkImage('https://www.koenig-solutions.com/img/logo.png')
        image: AssetImage('images/facebook.jpg'),
        width: 300,
        height: 200,
      ),
    )),
  )));
}
