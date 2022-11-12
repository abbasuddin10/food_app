import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khudha_nibaron/khabarditecay.dart';
import 'package:khudha_nibaron/splash.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: init(),
    );
  }
}

class init extends StatefulWidget {
  const init({Key? key}) : super(key: key);

  @override
  State<init> createState() => _initState();
}

class _initState extends State<init> {

  final Future<FirebaseApp> _initialization=Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Scaffold(
              body: Center(
                child: Text('Error ${snapshot.error}'),
              ),
            );
          }
          if(snapshot.connectionState==ConnectionState.done){
            return SplashScreen();
          }
          return Scaffold();
        }
    );
  }
}
