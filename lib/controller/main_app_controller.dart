
import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/model/user.dart';
import 'package:new_explorer_challenge/pages/home.dart';
import 'package:new_explorer_challenge/pages/home_login.dart';
import 'package:new_explorer_challenge/pages/profile.dart';
import 'package:new_explorer_challenge/pages/search.dart';
import 'package:new_explorer_challenge/values/values.dart';

class MainAppController extends StatefulWidget {

  final String uid;

  MainAppController(this.uid);

  @override
  _MainAppControllerState createState() => _MainAppControllerState();
}

class _MainAppControllerState extends State<MainAppController> {

  //String uid = "";
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  StreamSubscription streamSubscription;
  int page = 0;

  @override
  void initState() {
    super.initState();
    if(widget.uid != ""){
      streamSubscription = Firebase()
        .fireUser
        .doc(widget.uid)
        .snapshots()
        .listen((doc) {
          setState(() {
            me = UserClass(doc);
          });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(me == null){
      return Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: ResponsiveWidget.isSmallScreen(context)
            ? CurvedNavigationBar(
          backgroundColor: AppColors.greyLightColor,
          color: AppColors.beigeColor,
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
        )
            : null,
        body: showPageOff(),
      );
    }else{
      return Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: ResponsiveWidget.isSmallScreen(context)
            ? CurvedNavigationBar(
          backgroundColor: AppColors.greyLightColor,
          color: AppColors.beigeColor,
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
        )
            : null,
        body: showPageOn(),
      );
    }
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  Widget showPageOff(){
    switch(page){
      case 0:
        return HomePage();
      case 1:
        return SearchPage();
      default:
        return HomeLogin();
    }
  }

  Widget showPageOn(){
    switch(page){
      case 0:
        return HomePage();
      case 1:
        return SearchPage();
      default:
        return ProfilPage(me);
    }
  }
}


