
//import '../providers/alarm_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:icon_forest/mbi_linecons.dart';
import 'package:provider/provider.dart';

import '../provider/alarm_set_provider.dart';

class SetAlarmPage extends StatelessWidget {

  // TextEditingController hourController = TextEditingController();
  // TextEditingController minuteController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  int alarmId = 1;

  SetAlarmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AlarmProvider>(context);
    showprint() {
      print('Alarm DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Alarm'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            TimePickerSpinner(
              is24HourMode: false,
              normalTextStyle: TextStyle(fontSize: 14, color: Colors.black),
              highlightedTextStyle:
              TextStyle(fontSize: 30, color: Colors.blueAccent),
              spacing: 50,
              itemHeight: 50,
              isForce2Digits: false,
              onTimeChange: (time) {
                _dateTime = time;
                prov.hours = time.hour;
                prov.miniutes  = time.minute;

                //prov.ampm =time.

                //  _dateTime.hour.toString();
                //   minuteController.text = _dateTime.minute.toString();
                // });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                      child: Text(
                          '${prov.hours}'
                      )
                  ),
                ),
                SizedBox(width: 20),

                Text(
                    ':'            ),
                SizedBox(width: 20),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                      child:  Text(
                          '${prov.miniutes}'
                      )
                  ),
                ),

                // Container(
                //   height: 40,
                //   width: 40,
                //   decoration: BoxDecoration(
                //       shape: BoxShape.rectangle,
                //       color: Colors.blueAccent,
                //       borderRadius: BorderRadius.circular(11)),
                //   child: Center(
                //       child:  Text(
                //           '${prov.ampm}'
                //       )
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select RingTone'),
                IconButton(
                  icon: Icon(
                    MbiLineconsIcons.tag,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 1,
              runSpacing: 1,
              alignment: WrapAlignment.start,
              children: [
                TextButton(onPressed: () {}, child: Text('M')),
                TextButton(onPressed: () {}, child: Text('T')),
                TextButton(onPressed: () {}, child: Text('W')),
                TextButton(onPressed: () {}, child: Text('TH')),
                TextButton(onPressed: () {}, child: Text('F')),
                TextButton(onPressed: () {}, child: Text('S')),
                TextButton(onPressed: () {}, child: Text('S')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Alarm Name :'),
                Container(
                  width: 150,
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: 'alarm', border: InputBorder.none)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                  child:  Text(
                    'Create Alarm',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: prov.fireAlarm,

                  ),
            ),
          ])),
    );
  }
}
