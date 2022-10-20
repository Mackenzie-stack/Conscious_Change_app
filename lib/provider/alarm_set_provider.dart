import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';

class AlarmProvider extends ChangeNotifier{

//  FlutterSoundRecorder? audioRecorder;
  final player = FlutterSoundPlayer();
  bool _isAlarmOn = false;

  int alarmId = 1;
  int _miniutes = 0;
  int _hours = 0;
  String _ampm ='';


  bool get isOn => _isAlarmOn;
  String get ampm => _ampm;
  int get miniutes => _miniutes;
  int get hours => _hours;




  set isOn(bool value) {
    _isAlarmOn = value;
  }


  set ampm(String value) {
    _ampm = value;
  }

  set miniutes(int value) {
    _miniutes = value;
    notifyListeners();
  }

  set hours(int value) {
    _hours = value;
    notifyListeners();
  }

  // void  startPlaying() async{
  //
  //  // directoryPath = await _directoryPath();
  //  // completePath = await _completePath(directoryPath);
  //   //_isPlaying= true;
  //   await player.openPlayer();
  //   //String dirc = directoryPath;
  //   await player!.startPlayer(fromURI: record);
  //  // await player!.startPlayer(fromURI: dirc+'$record',);
  //   //player.openPlayerCompleted(1, _isPlaying = false );
  //   notifyListeners();
  // }

  void fireAlarm()  {
    AndroidAlarmManager.oneShot(
        Duration(seconds: 10),
        alarmId,

        printer);

    print('Alarm test FIRED at ${DateTime.now()}');
    //FlutterRingtonePlayer.playRingtone();
    notifyListeners();
  }

  static  void printer() {
    print('ALLARM FROM PROVIDER');
  }


}