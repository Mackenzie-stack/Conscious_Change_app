
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/voice_record_provide.dart';
import '../widget/record_view.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SoundRecorder>(context);

    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:
          Text(
            '00:00:00',
            style: TextStyle(fontSize: 30),
          ),
          ),

          // ROW TO HOLD MIC ICON AND STOP ICON
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //MIC ICON

              IconButton(
                  icon: Icon(Icons.mic,
                    size: 50,),

                  color: Colors.green,
                  onPressed: () {
                    prov.record();
                  }
              ),
              //:
              IconButton( //STOP RECORDING ICON
                icon: Icon(
                  Icons.stop,
                  size: 50,),
                color: Colors.green,
                onPressed: () {
                  prov.stopRecording();
                },
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),

          SizedBox(height: 10),

          Container(
              height: 400,
              width: 400,
              child: RecordView()),
        ],

      ),
    );
  }
}