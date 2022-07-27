import 'package:flutter/material.dart';

import 'MyListNavigationPage.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Demo"),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListTilePage(
                        title: "Azim Ebrahemi",
                        designation: 'Software Developer',
                        img: "images/facebook.jpg");
                  }));
                },
                leading: Icon(
                  Icons.person,
                  size: 32,
                ),
                title: Text("Azim Ebrahemi"),
                subtitle: Text('Software Developer'),
                trailing: Icon(Icons.arrow_forward_ios)),
            ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListTilePage(title: "Abdul", designation: 'Testing');
                  }));
                },
                leading: Icon(
                  Icons.person,
                  size: 32,
                ),
                title: Text("Abdul"),
                subtitle: Text('Testing'),
                trailing: Icon(Icons.arrow_forward_ios)),
            ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListTilePage(
                        title: "Mohammad Zaboor",
                        designation: 'Front-End Developer');
                  }));
                },
                leading: Icon(
                  Icons.person,
                  size: 32,
                ),
                title: Text("Mohammad Zaboor"),
                subtitle: Text('Front-End  Developer'),
                trailing: Icon(Icons.arrow_forward_ios)),
            ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListTilePage(
                        title: "Azim Ebrahemi",
                        designation: 'Software Developer');
                  }));
                },
                leading: Icon(
                  Icons.person,
                  size: 32,
                ),
                title: Text("Merwis"),
                subtitle: Text('Etical Hacker'),
                trailing: Icon(Icons.arrow_forward_ios)),
            ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.person,
                  size: 32,
                ),
                title: Text("Mansour"),
                subtitle: Text('ERP Adminstrator'),
                trailing: Icon(Icons.arrow_forward_ios)),
            ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.person,
                  size: 32,
                ),
                title: Text("Pankaj kapoor"),
                subtitle: Text('Corporate Trainer'),
                trailing: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ),
    );
  }
}
