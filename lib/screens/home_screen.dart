
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int alarmId = 1;

   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Power Your Dream"),

      ),

      body: Column(
        children: [

          TextButton(
              onPressed: () {
            AndroidAlarmManager.periodic(
                Duration(seconds: 5), alarmId, showprint);
          },
              child: Text('Click'))


        ],
      ),
    );
  }

  showprint() {
    print(
      " ALARM DONEEEEEEEE"
    );
  }
}
