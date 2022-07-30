import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/PaymentPage.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class PizzaApp extends StatefulWidget {
  const PizzaApp({Key key}) : super(key: key);

  @override
  State<PizzaApp> createState() => _PizzaAppState();
}

class _PizzaAppState extends State<PizzaApp> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  double _initialValue = 0.0;
  bool _isPaid = false;
  String PizzaTopping = "";
  String PizzaSize = "";

  DateTime today = DateTime.now();
  TimeOfDay todayTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pizza App"),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 50, 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pop(context);
                  },
                  child: Text("Logout")),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Text(
                'Select your Toppings:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              CheckboxGroup(
                labels: [
                  "Onion",
                  "Black Olive",
                  "Mushrooms",
                  "Green Pepper",
                  "Chicken",
                ],
                onSelected: (List<String> selected) {
                  // print(selected);
                  setState(() {
                    PizzaTopping = selected.toString();
                  });
                },
              ),
              Text(
                'Select your Pizza Size:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              RadioButtonGroup(
                labels: ["Small", "Medium", "Large"],
                onSelected: (String selected) {
                  // print(selected);
                  setState(() {
                    PizzaSize = selected;
                  });
                },
              ),
              Row(
                children: [
                  Text(
                    'Pizza Quantity:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Slider(
                      value: _initialValue,
                      min: 0,
                      max: 20,
                      divisions: 20,
                      label: '$_initialValue',
                      onChanged: (newValue) {
                        setState(() {
                          _initialValue = newValue;
                        });
                        print("Pizza Quantity: $_initialValue");
                      }),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Payment Status:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Switch(
                      value: _isPaid,
                      onChanged: (bool status) {
                        setState(() {
                          _isPaid = status;
                        });
                      }),
                  Text(
                    _isPaid ? "Payment Done" : "Not Recieved",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Delivery Date:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        selectDate(context);
                      },
                      icon: Icon(Icons.date_range)),
                  Text('${today.day}-${today.month}-${today.year}')
                ],
              ),
              Row(
                children: [
                  Text(
                    'Delivery Time:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        selectTime(context);
                      },
                      icon: Icon(Icons.access_time)),
                  Text('${todayTime.hour}:${todayTime.minute}')
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    showPreview(context);
                  },
                  child: Text("Preview Order"))
            ],
          ),
        ));
  }

  void selectDate(BuildContext context) async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: DateTime(2021),
        lastDate: DateTime(2025));

    // print(pickedDate);
    if (pickedDate != null && pickedDate != today) {
      setState(() {
        today = pickedDate;
      });
    }
  }

  void selectTime(BuildContext context) async {
    TimeOfDay pickedTime =
        await showTimePicker(context: context, initialTime: todayTime);
    setState(() {
      todayTime = pickedTime;
    });
  }

  void showPreview(BuildContext context) {
    // For IOS Alert Dialog Box
    // var alertDialog = CupertinoAlertDialog(
    var alertDialog = AlertDialog(
      title: Text(
        "Your Order",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
        textAlign: TextAlign.center,
      ),
      content: Text(
          'Topping: $PizzaTopping\nPizza Size: $PizzaSize\nPizza Quantity: $_initialValue\nDelivery Date: ${today.day}-${today.month}-${today.year}\nDelivery Time: ${todayTime.hour}:${todayTime.minute}'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaymentPage();
                  }));
                },
                child: Text("Pay")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Review Order")),
          ],
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}
