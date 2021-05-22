import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'main.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var date=new DateTime.now();
  var stream;

  @override
  Widget build(BuildContext context) {
    final day=DateFormat('EEEE').format(date);
    var random=new Random();

    var streamBuilder=StreamBuilder(
        stream: FirebaseFirestore.instance.collection('SmallQuotes').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) return Text('Loading... Please Wait..');
          return Container(
              padding: new EdgeInsets.all(15.0),
              child:
              Text(snapshot.data.docs[random.nextInt(100)]['small'],style: TextStyle(fontSize: 25,color: Colors.black,fontFamily: 'Coves'), textAlign: TextAlign.center)

          );
        }
    );

    return Scaffold(
        backgroundColor: Colors.white,

        body: Wrap(
          children: [
            Center(
              child:
                  SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:new EdgeInsets.only(top:50.0),
                  child:
                      Column(
                        children: [
                  Text(day,style: TextStyle(fontSize: 50,color: Colors.amberAccent,fontFamily: 'Moderne Sans')),
                  SizedBox(height: 5),
                  Text(new DateFormat.jm().format(DateTime.now()),style: TextStyle(fontSize: 30,color: Colors.amberAccent)),
                        ]
                      )
                  ),
                  streamBuilder,
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton( child: Text("Life")),
                      TextButton(child: Text("Love")),
                      IconButton(icon: Icon(Icons.adb)),
                      IconButton(icon: Icon(Icons.ac_unit))
                    ],
                  ),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: Icon(Icons.adb)),
                      IconButton(icon: Icon(Icons.ac_unit))
                    ],
                  )

                ],

              ),
            )
            )
          ],
        )
    );
  }
}


