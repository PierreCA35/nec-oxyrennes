import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_explorer_challenge/values/values.dart';

import 'controller/main_app_controller.dart';

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
      home: authStatus(),
    );
  }

  Widget authStatus(){
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        return (!snapshot.hasData)
          ? Scaffold(body: MainAppController(""))
          : Scaffold(body: MainAppController(snapshot.data.uid));
      },
    );
  }
}