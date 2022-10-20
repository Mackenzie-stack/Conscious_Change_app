
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/voice_record_provide.dart';

class RecordView extends StatelessWidget {
  const RecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SoundRecorder>(context);
    return  prov.recordList.isEmpty ?
    Center(child:  Text ('Record Empty'),)
        : ListView.builder(
        itemCount: prov.recordList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading:
            // Icon(MbiLineconsIcons.data,
               Text(prov.recordList[index].toString(),
              //style: TextStyle(color: Colors.green, fontSize:1),
          ),
              title: Text(prov.recordList[index].toString(),
                style: TextStyle(color: Colors.green, fontSize:1), ),
           // title: Text("k"),
            //PopupButton(),
            //leading: const Icon(Icons.list),

            trailing:    //PopupButton(),

            //prov.isPlaying ?
            IconButton(
              icon: Icon(
                Icons.play_arrow,
              ),
              color: Colors.green,
              onPressed: () {
                prov.startPlaying(prov.recordList.elementAt(index).toString());},
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.play_arrow,
            //   ),
            //   color: Colors.green,
            //   onPressed: () { },
            // ),


            // ElevatedButton.icon(
            // onPressed: (){
            // prov.startPlaying(prov.recordList[index]);
            // print("You pressed Icon Elevated Button");    },
            // icon: Icon(Icons.play_arrow,
            // size: 20,),
            // label: Text(''),
            // ),
            //title: Text("List item $index")
          );
        });

  }
}