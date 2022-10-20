import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecorder extends ChangeNotifier {
  SoundRecorder() {
    init();
  }

  FlutterSoundRecorder? audioRecorder;
  final player = FlutterSoundPlayer();

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  String completePath = "";
  String directoryPath = "";
  bool _isRecorderInitialised = false;
  List<String> _recordList = [];

  bool get isRecording {
    return audioRecorder!.isRecording;
  }

  List<String> get recordList => _recordList;

//INITIAL MEHTOD THAT WILL INITIATE THE RECORDER DETAILS
  Future init() async {
    audioRecorder = FlutterSoundRecorder();
    final statusMic = await Permission.microphone.request();
    if (statusMic != PermissionStatus.granted) {
      throw RecordingPermissionException('microphone permission');
    }
    final statusStorage = await Permission.storage.status;
    if (!statusStorage.isGranted) {
      await Permission.storage.request();
    }
    await audioRecorder!.openRecorder();

    _createDirectory();
    //_createFile();
    _isRecorderInitialised = true;

    // getApplicationDocumentsDirectory().then((value) {
    //   directoryPath = value;
    //   _appDirectory.list().listen((onData) {
    //     if (onData.path.contains('.aac')) _recordList.add(onData.path);
    //     print(onData.path);
    //   }).onDone(() {
    //     _recordList = _recordList.reversed.toList();
    //   });
    // }
    // );
    var dircc = Directory(
        '/storage/emulated/0/Android/data/com.example.app/files/ConsciousRecords/');
    List contents = dircc.listSync();
    for (var filee in contents) {
      if (filee is File) {
        String basename = (filee.path);
        String fileNameee = filee.path.split('/').last;
        _recordList.add(fileNameee);
        _recordList = _recordList.reversed.toList();
      }
      //_recordList.add(filee.toString());
    }
    // dircc.list().listen((onData) {
    //     if (onData.path.contains('.aac')) _recordList.add(onData.path);
    //   }).onDone(() {
    //     _recordList.sort();
    //     _recordList = _recordList.reversed.toList();
    //   });
    notifyListeners();

    print('Init has been ran');
  }

  //METHOD TO START RECORDING VOICE
  void record() async {
    directoryPath = await _directoryPath();
    completePath = await _completePath(directoryPath);
    if (!_isRecorderInitialised) return;
    await audioRecorder!.startRecorder(
      toFile: completePath,
    );
    _recordList = _recordList.reversed.toList();
    notifyListeners();
    print("This is Path where the file will be : " + completePath);
  }

  //METHOD TO STOP RECORDING VOICE
  Future stopRecording() async {
    if (!_isRecorderInitialised) return;
    audioRecorder!.stopRecorder();
    File f = File(completePath).absolute;
    // print("The created file is : $f");
    // recordList.add(f.toString());
    print(recordList);

    // _appDirectory.list().listen((onData) {
    //   if (onData.path.contains('.aac')) _recordList.add(onData.path);
    // }).onDone(() {
    //   _recordList.sort();
    //   _recordList = _recordList.reversed.toList();
    // });
    notifyListeners();
  }

  void dispose() {
    if (!_isRecorderInitialised) return;
    audioRecorder!.closeRecorder();
    audioRecorder = null;
    _isRecorderInitialised = false;
  }

  // Future toggleRecording() async{
  //   if(_audioRecorder!.isStopped){
  //     await record();
  //   }else{
  //     await stop();
  //
  //   }
  // }

  Future<String> _directoryPath() async {
    var directory = Directory(
        '/storage/emulated/0/Android/data/com.example.app/files/ConsciousRecords/');

    //var directory = await getExternalStorageDirectory();
    var directoryPath = directory!.path;
    return "$directoryPath/ConsciousRecords/";
  }

  String _fileName() {
    return "record" + DateTime.now().millisecondsSinceEpoch.toString() + ".aac";
  }

  Future<String> _completePath(String directory) async {
    var fileName = _fileName();
    print(fileName);
    recordList.add(fileName);
    notifyListeners();
    return "$directory$fileName";
  }

  Future _createFile() async {
    File(completePath).create(recursive: true).then((File file) async {
      //write to file
      Uint8List bytes = await file.readAsBytes();
      file.writeAsBytes(bytes);
      print("FILE CREATED AT : " + file.path);
    });
  }

  void _createDirectory() async {
    bool isDirectoryCreated = await Directory(directoryPath).exists();
    if (!isDirectoryCreated) {
      Directory(directoryPath).create().then((Directory directory) {
        print("DIRECTORY CREATED AT : " + directory.path);
      });
    }
  }

  Future startPlaying(String record) async {
    //directoryPath = await _directoryPath();
    //completePath = await _completePath(directoryPath);

    //_isPlaying= true;
     player.openPlayer();
    //String dirc = directoryPath;
    //_directoryPath
    //await player!.startPlayer(fromURI: dirc + '$record' );
    await player.startPlayer(fromURI: '$_directoryPath' + '/'+ '$record' );
    //player.openPlayerCompleted(1, _isPlaying = false );
    //notifyListeners();
  }

  Future<void> stopPlaying() async {
    _createFile();
    //player.stopPlayer();
    await player.stopPlayer();
    notifyListeners();
  }

  Future<void> pausePlay() async {
    _createFile();
    //player.stopPlayer();
    await player.pausePlayer();
    notifyListeners();
  }

  Future<void> resumePlay() async {
    _createFile();
    //player.stopPlayer();
    await player.resumePlayer();
    notifyListeners();
  }
}
