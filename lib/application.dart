import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lostark_pattern/page/error.dart';
import 'package:lostark_pattern/page/home.dart';
import 'package:lostark_pattern/page/splash.dart';

class Application extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorPage();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomePage(),
          );
        }

        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashPage(),
        );
      },
    );
  }
}
