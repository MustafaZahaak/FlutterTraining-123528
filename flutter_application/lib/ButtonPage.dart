import 'package:flutter/material.dart';
import 'WebView.dart';

class Buttonpage extends StatelessWidget {
  Buttonpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Page"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text('Do Payment'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WebViewDemo();
              }));
            },
          ),
        ),
      ),
    );
  }
}
