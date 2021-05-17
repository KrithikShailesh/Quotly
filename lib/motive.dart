import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var date=new DateTime.now();
  bool _initialized = false;
  bool _error = false;
  var stream;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    final day=DateFormat('EEEE').format(date);
    var random=new Random();

    var streamBuilder=StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Quotes').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) return Text('Loading... Please Wait..');
          return Container(
              padding: new EdgeInsets.all(25.0),
              child:
              Text(snapshot.data.docs[random.nextInt(100)]['quote'],style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'Coves'), textAlign: TextAlign.center)

          );
        }
    );

    return Scaffold(
        backgroundColor: Colors.black,

        body: Wrap(
          children: [
            Center(
              child:
                  SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:new EdgeInsets.all(50.0),
                  child:
                      Column(
                        children: [
                  Text(day,style: TextStyle(fontSize: 50,color: Colors.amberAccent,fontFamily: 'Moderne Sans')),
                  SizedBox(height: 5),
                  Text(new DateFormat.jm().format(DateTime.now()),style: TextStyle(fontSize: 30,color: Colors.amberAccent)),
                        ]
                      )
                  ),
                  SizedBox(height: 40),
                  streamBuilder,

                ],
              ),
            )
            )
          ],
        )
    );
  }
}


