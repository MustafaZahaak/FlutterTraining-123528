import 'package:flutter/material.dart';

class SICalculator extends StatefulWidget {
  const SICalculator({Key key}) : super(key: key);

  @override
  State<SICalculator> createState() => _SICalculatorState();
}

class _SICalculatorState extends State<SICalculator> {
  TextEditingController _principalController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  String displayResult = "";
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SI Calculator"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Image(image: AssetImage('images/money.jpg')),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _principalController,
              // keyboardType: TextInputType.emailAddress,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Principal Amount e.g. 1000",
                  labelText: "Principal"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Rate",
                  labelText: "Rate"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Time",
                  labelText: "Time"),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool b) {
                      setState(() {
                        isChecked = b;
                      });
                    }),
                Text("Are you agreed the terms and Conditions"),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: isChecked
                            ? () {
                                setState(() {
                                  displayResult = _calculateResult();
                                });
                              }
                            : null,
                        child: Text('Calculate'))),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          _clearData();
                        },
                        child: Text('Reset'))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              displayResult,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  String _calculateResult() {
    double amount = double.parse(_principalController.text);
    double rate = double.parse(_rateController.text);
    double time = double.parse(_timeController.text);

    double totalAmount = amount + (amount * time * rate) / 100;
    String result =
        'After $time years, Your investment will be worth $totalAmount';
    return result;
  }

  void _clearData() {
    setState(() {
      _principalController.text = "";
      _rateController.text = "";
      _timeController.text = "";
      displayResult = "";
      isChecked = false;
    });
  }
}
