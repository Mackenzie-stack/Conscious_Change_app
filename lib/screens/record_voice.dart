
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

class RecordVoice extends StatefulWidget {
  @override
  _RecordVoiceState createState() => _RecordVoiceState();
}

class _RecordVoiceState extends State<RecordVoice> {
  bool isOn = false;
  int alarmId = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App BAR'),
      ),
      body: Column(
        children: [

          TextButton(

              onPressed:(){
                //FlutterRingtonePlayer.playAlarm();
                AndroidAlarmManager.periodic(Duration(seconds: 60), alarmId, fireAlarm);
                },
              child: Text('Click')),

          TextButton(
              onPressed:(){
                AndroidAlarmManager.cancel(alarmId);
              },
              child: Text('Stop')),
          Center(
            child: Transform.scale(
              scale: 2,
              child: Switch(
                value: isOn,
                onChanged: (value) {
                  setState(() {
                    isOn = value;
                  });
                  if (isOn == true) {
                    AndroidAlarmManager.periodic(
                        Duration(seconds: 5), alarmId, fireAlarm);
                  } else {
                    AndroidAlarmManager.cancel(alarmId);
                    print('Alarm Timer Canceled');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void fireAlarm() {
  print('Alarm FIRED FROM RECORD VOICE at ${DateTime.now()}');
}