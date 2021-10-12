import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/authenticate/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong "));
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return SignIn(
              toggleView: () {},
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Center(child: CircularProgressIndicator());
          // return Loading();
        },
      ),
    );
  }
}
