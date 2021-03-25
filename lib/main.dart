import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Explorer Challenge',
      home: home(),
    );
  }

  Widget home(){
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Image.asset("assets/logo_NEC.png"),
            ],
          ),
        ),
      ),
    );
  }
}