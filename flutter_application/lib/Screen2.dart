import 'package:flutter/material.dart';
import 'package:flutter_application/Screen1.dart';

class Screen2 extends StatelessWidget {
  var title = "";
  Screen2({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text('goto Scrren-2'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
