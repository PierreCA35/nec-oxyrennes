
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/pages/home.dart';
import 'package:new_explorer_challenge/pages/profile.dart';
import 'package:new_explorer_challenge/pages/search.dart';

class MainAppController extends StatefulWidget {

  @override
  _MainAppControllerState createState() => _MainAppControllerState();
}

class _MainAppControllerState extends State<MainAppController> {

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  int page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        height: 45.0,
        items: [
          Icon(Icons.home, size: 25.0,),
          Icon(Icons.search, size: 25.0,),
          Icon(Icons.account_circle_rounded, size: 25.0),
        ],
        onTap: (index){
          setState(() {
            page = index;
          });
        },
      ),
      body: showPage(),
    );
  }



  Widget showPage(){
    switch(page){
      case 0:
        return HomePage();
      case 1:
        return SearchPage();
      default:
        return ProfilPage();
    }
  }
}


