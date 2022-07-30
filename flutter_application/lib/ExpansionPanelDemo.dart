import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({Key key}) : super(key: key);

  @override
  State<ExpansionPanelDemo> createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<Item> _data = generateItems(5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expansion Panel')),
      body: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _data[panelIndex].isExpanded = !_data[panelIndex].isExpanded;
              });
            },
            children: _data.map((Item item) {
              return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpaded) {
                    return Text(
                      item.headerValue,
                      style: TextStyle(fontSize: 20, color: Colors.orange),
                    );
                  },
                  isExpanded: item.isExpanded,
                  body: Container(
                    child: Text(item.bodyValue,
                        style: TextStyle(fontSize: 20, color: Colors.red)),
                  ));
            }).toList(),
          )
        ],
      ),
    );
  }
}

class Item {
  String headerValue;
  String bodyValue;
  bool isExpanded = false;

  Item({this.headerValue, this.bodyValue, this.isExpanded = false});
}

List<Item> generateItems(int numberofItems) {
  return List.generate(numberofItems, (index) {
    return Item(headerValue: 'Panel-$index', bodyValue: 'This is Panel-$index');
  });
}
