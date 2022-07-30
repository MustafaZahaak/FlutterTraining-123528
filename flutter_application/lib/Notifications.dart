import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var _notification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Visibility(
              visible: _notification,
              child: ListTile(
                tileColor: Colors.orange,
                leading: Icon(Icons.info_outline),
                title: Text("You recieved a Notification"),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _notification = false;
                    });
                  },
                  icon: Icon(Icons.close),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: snackbarNotification,
              child: Text("Snack Bar Notification")),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _notification = true;
                });
              },
              child: Text("Custom Notification")),
        ]),
      ),
    );
  }

  void snackbarNotification() {
    SnackBar snackBar = SnackBar(
      content: Text("OTP has been sent!"),
      duration: Duration(seconds: 10),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        onPressed: () {},
        label: "OK",
      ),
    );
    SnackBar snackBar1 = SnackBar(
      content: Text("User register Successfully"),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        onPressed: () {},
        label: "OK",
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
