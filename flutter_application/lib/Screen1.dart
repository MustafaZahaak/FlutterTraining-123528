import 'package:flutter/material.dart';
import 'package:flutter_application/Screen2.dart';

class Screen1 extends StatelessWidget {
  var title = "";
  Screen1({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text('Goto Scrren-2'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Screen2();
              }));
            },
          ),
        ),
      ),
    );
  }
}
