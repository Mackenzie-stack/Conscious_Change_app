import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/alarm_set_provider.dart';
import 'provider/voice_record_provide.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_)=> SoundRecorder()),
        ChangeNotifierProvider(create: (_)=> AlarmProvider()),
        ChangeNotifierProvider(create: (_)=> SoundRecorder()),

      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
