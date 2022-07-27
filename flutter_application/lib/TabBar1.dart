import 'package:flutter/material.dart';
import 'package:flutter_application/SamplePages.dart';

class TabBarDemo1 extends StatelessWidget {
  const TabBarDemo1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab Bar Demo"),
            bottom: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    child: Icon(Icons.camera_alt),
                  ),
                  Tab(
                      child: Text(
                    "CHAT",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Tab(
                      child: Text("STATUS",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Tab(
                      child: Text("CALL",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ]),
          ),
          body: TabBarView(children: [
            HomePage(),
            ServicePage(),
            AboutPage(),
            SettingPage()
          ]),
        ));
  }
}
