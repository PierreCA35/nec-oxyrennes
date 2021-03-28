
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/pages/log_sign/login_signup_page.dart';
import 'package:new_explorer_challenge/pages/search.dart';
import 'package:new_explorer_challenge/values/values.dart';

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
      body: showPage(),
    );
  }



  Widget showPage(){
    switch(page){
      case 0:
        return LoginSignUpPage();
      case 1:
        return SearchPage();
      default:
        return LoginSignUpPage();
    }
  }
}


