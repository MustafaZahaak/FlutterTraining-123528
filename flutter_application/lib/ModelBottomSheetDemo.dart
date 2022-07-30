import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key key}) : super(key: key);

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('BottomSheets Demo')),
      body: Center(
          child: IconButton(
        icon: Icon(Icons.share),
        iconSize: 30,
        onPressed: () {
          // displayModelSheet(context);
          displayPersistentSheet(context);
        },
      )),
    );
  }

  void displayModelSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            // height: 400,
            // alignment: Alignment.topCenter,
            // child: Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text(
            //     "This is Bottom Sheet",
            //     style: TextStyle(fontSize: 30),
            //   ),
            // ),
            child: Wrap(
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/1200px-WhatsApp.svg.png')),
                      title: Text('WhatsApp'),
                    ),
                    ListTile(
                      leading: Image(
                          image: NetworkImage(
                              'https://cdn.cdnlogo.com/logos/f/35/facebook.png')),
                      title: Text('Facebook'),
                    ),
                    Divider(height: 20),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      title: Text('Setting'),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void displayPersistentSheet(BuildContext context) {
    _scaffoldKey.currentState.showBottomSheet((context) {
      return Container(
        color: Colors.amberAccent,
        child: Wrap(
          children: [
            Column(
              children: [
                ListTile(
                  leading: Image(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/1200px-WhatsApp.svg.png')),
                  title: Text('WhatsApp'),
                ),
                ListTile(
                  leading: Image(
                      image: NetworkImage(
                          'https://cdn.cdnlogo.com/logos/f/35/facebook.png')),
                  title: Text('Facebook'),
                ),
                Divider(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  title: Text('Setting'),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
