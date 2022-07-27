import 'package:flutter/material.dart';

class ListTilePage extends StatelessWidget {
  var title = "";
  var designation = "";
  var img = "";
  ListTilePage({Key key, this.title, this.designation, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage(img)),
            Text(designation),
          ],
        ),
      ),
    );
  }
}
