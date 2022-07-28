import 'package:flutter/material.dart';

class StackWidgetDemo extends StatelessWidget {
  const StackWidgetDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StackWidget Demo "),
      ),
      body: Stack(
        children: [
          Positioned(
              child: Image(
                image: AssetImage('images/mars.jpg'),
              ),
              left: 10,
              right: 10,
              top: 150),
          Positioned(
            child: Text(
              'MARS',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            top: 300,
            left: 250,
          ),
        ],
      ),
    );
  }
}
