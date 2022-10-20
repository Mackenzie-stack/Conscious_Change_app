

import 'package:believe_change/screens/voice_screen.dart';
import 'package:flutter/material.dart';

import 'record_voice.dart';
import 'set_alarm_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  //if(await Permission.s)
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static  List<Widget> frontpages = <Widget>[
   // HomeScreen(),
    SetAlarmPage(),
    RecordVoice(),
    const RecordScreen(),
  ];


  static const List<Widget> pages = <Widget>[
    Text(
      'HOME PAGE',
      style: optionStyle,
    ),
    Text(
      'RECORD VOICE',
      style: optionStyle,
    ),
    Text(
      'SET AlARM',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // index final status = await Permission.accessMediaLocation  .request();
  //  if (status == PermissionStatus.granted) {
  //  print('Permission granted');
  //  } else if (status == PermissionStatus.denied) {
  //  print('Permission denied. Show a dialog and again ask for the permission');
  //  } else if (status == PermissionStatus.permanentlyDenied) {
  //  print('Take the user to the settings page.');
  //  await openAppSettings();
  //  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: frontpages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: ('Record Voice'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ('SetUp'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.mic),
          //   label: ('Recorder'),
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

}
