import 'package:flutter/material.dart';

class MyButtons extends StatefulWidget {
  const MyButtons({Key key}) : super(key: key);

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  var cities = ["India", "Iraq", "Japan", "China", "Dubai"];

  var choices = ["Inbox", "Sent Items", "Junk Email", "Sign-out"];

  var firstCity = "India";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buttons Demo"),
          backgroundColor: Colors.purple,
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return choices.map((String MyChoices) {
                  return PopupMenuItem(
                    child: Text(MyChoices),
                    value: MyChoices,
                  );
                }).toList();
              },
              onSelected: (String newItem) {
                print(newItem);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Button Clicked');
                  },
                  child: Text(
                    "Elevated Button",
                    style: TextStyle(fontSize: 24),
                  ),
                  // style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Text Button",
                      style: TextStyle(fontSize: 24),
                    )),
                OutlinedButton(
                    onPressed: () {}, child: Text("Outlined Button")),
                IconButton(
                    onPressed: () {
                      print("Icon Button Pressed");
                    },
                    tooltip: "Set Alarm",
                    icon: Icon(
                      Icons.watch_later,
                      size: 40,
                      color: Colors.blue,
                    )),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(onPressed: () {}, child: Text("Outlined ")),
                    OutlinedButton(onPressed: () {}, child: Text("Outlined ")),
                    OutlinedButton(onPressed: () {}, child: Text("Outlined ")),
                  ],
                ),

                // Drop-down Button
                Container(
                  child: DropdownButton(
                    items: cities.map((String dropDownItems) {
                      return DropdownMenuItem(
                          child: Text(
                            dropDownItems,
                            style: TextStyle(
                                fontSize: 26,
                                color: (firstCity == dropDownItems)
                                    ? Colors.red
                                    : Colors.black),
                          ),
                          value: dropDownItems);
                    }).toList(),
                    value: firstCity,
                    onChanged: (String userNewValue) {
                      setState(() {
                        firstCity = userNewValue;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          // child: Text("Logout"),
          onPressed: () {
            print("Floating Button clicked");
          },
        ),
      ),
    );
  }
}
