import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key key}) : super(key: key);

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  var data = "102";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Employees Recoreds",
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
            // SizedBox(height: 20,),
            Divider(
              height: 50,
              color: Colors.blue,
            ),

            // Data Table

            DataTable(columns: [
              DataColumn(label: Text("Id")),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Gender")),
            ], rows: [
              DataRow(cells: [
                DataCell(Text("101")),
                DataCell(Text("Mohammad Mustaq")),
                DataCell(Text("Male")),
              ]),
              DataRow(cells: [
                DataCell(Text(data), onTap: () {
                  var r = updateField(data);
                  setState(() {
                    Text(r);
                  });
                }),
                DataCell(Text("Mohammad Zubaar")),
                DataCell(Text("Male")),
              ]),
              DataRow(cells: [
                DataCell(Text("103")),
                DataCell(Text("Saiaraa")),
                DataCell(Text("Female")),
              ]),
            ])
          ],
        ),
      ),
    );
  }

  String updateField(data) {
    // print('Cell clicked to perform some logic');
    var newdata = "105";
    setState(() {
      data = newdata;
      return data;
    });
  }
}
