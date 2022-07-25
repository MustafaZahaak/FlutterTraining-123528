import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Koenig Solutions Pvt. Ltd',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image(
                  image: NetworkImage(
                      'https://miro.medium.com/max/500/1*cPh7ujRIfcHAy4kW2ADGOw.png'),
                  width: 120,
                  height: 120,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "ReactJS Training",
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 36,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.purple,
          ),

          // Card-2
          Card(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/2048px-Angular_full_color_logo.svg.png'),
                  width: 120,
                  height: 120,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Angular Training",
                  style: TextStyle(fontSize: 30, color: Colors.orange),
                )
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.purple,
          ),
        ],
      ),
    )),
  );
}
