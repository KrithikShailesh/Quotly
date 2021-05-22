import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:motivator/motive.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Splash(),
      debugShowCheckedModeBanner: false
    );
  }
}

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new Screen(),
      title: Text('Q', style: TextStyle( color: Colors.amberAccent,fontFamily: 'Quasik',fontSize: 300)),
      useLoader: false,
      backgroundColor: Colors.white
    );
  }
}