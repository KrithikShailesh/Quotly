
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class General extends StatefulWidget {
  const General({Key key}) : super(key: key);

  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('General Quotes')),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Quotes').snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return Text("Loading... please wait..");
              return ListView.builder(
                  itemCount: 55,
                  itemBuilder: (context, index){
                    DocumentSnapshot quotes=snapshot.data.docs[index];

                    return Center(
                      child: Card(
                          color: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),

                        elevation: 20,
                        margin: EdgeInsets.all(20),
                        child: Container(

                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                  quotes['quote'],style: TextStyle(fontFamily: 'Coves',fontSize: 25,color: Colors.black),
                              )
                            ],
                          ),
                        )
                      )
                      //
                    );
                  }
              );
            }
        )
    );
  }
}

