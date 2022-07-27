import 'package:flutter/material.dart';
import 'package:flutter_application/SamplePages.dart';

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({Key key}) : super(key: key);

  @override
  State<BottomNavigationDemo> createState() => _BottomNavigationDemo();
}

class _BottomNavigationDemo extends State<BottomNavigationDemo> {
  // variable for updating currentIndex
  var _selectedItem = 0;

  // variable for container to display
  var _pagesData = [HomePage(), ServicePage(), AboutPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigation Demo'),
      ),
      body: Container(
        child: _pagesData[_selectedItem],
      ),

      // Out of Body
      bottomNavigationBar: BottomNavigationBar(
        // items for creating bottom navigation bar items
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service), label: "Service"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        fixedColor: Colors.white,
        currentIndex: _selectedItem,
        onTap: (setValue) {
          setState(() {
            _selectedItem = setValue;
          });
        },
      ),
    );
  }
}
