import 'package:flutter/material.dart';

class BackgroundImageDemo extends StatelessWidget {
  const BackgroundImageDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BackgroundImage Demo "),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.jfif'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Text(
              "Image in the Background",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
