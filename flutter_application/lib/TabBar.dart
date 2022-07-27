import 'package:flutter/material.dart';
import 'package:flutter_application/SamplePages.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bar Demo"),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            // 1st container for TabBar
            Container(
              child: TabBar(
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
            // 2nd container for TabBar View
            Expanded(
              child: TabBarView(children: [
                HomePage(),
                ServicePage(),
                AboutPage(),
                SettingPage()
              ]),
            ),
          ],
        ),
      ),

      

    );
  }
}
