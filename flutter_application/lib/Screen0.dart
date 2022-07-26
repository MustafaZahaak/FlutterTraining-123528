import 'package:flutter/material.dart';
import 'package:flutter_application/Screen1.dart';

class Screen0 extends StatelessWidget {
  var title = "";
  var msg = "";
  Screen0({Key key, this.title, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text(msg),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Screen1();
              }));
            },
          ),
        ),
      ),
    );
  }
}
