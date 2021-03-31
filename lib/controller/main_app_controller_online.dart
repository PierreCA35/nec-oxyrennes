
import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/model/user.dart';
import 'package:new_explorer_challenge/pages/home.dart';
import 'package:new_explorer_challenge/pages/profile.dart';
import 'package:new_explorer_challenge/pages/search.dart';
import 'package:new_explorer_challenge/values/values.dart';

class MainAppControllerOnline extends StatefulWidget {

  final String uid;

  MainAppControllerOnline(this.uid);

  @override
  _MainAppControllerOnlineState createState() => _MainAppControllerOnlineState();
}

class _MainAppControllerOnlineState extends State<MainAppControllerOnline> {

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  StreamSubscription streamSubscription;
  int page = 0;

  @override
  void initState() {
    super.initState();
    streamSubscription = FirebaseClass()
      .fireUser
      .doc(widget.uid)
      .snapshots()
      .listen((doc) {
        setState(() {
          me = UserClass(doc);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if(me == null){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(AppColors.beigeColor)),);
    }else{
      return Scaffold(
        key: _globalKey,
        appBar: !ResponsiveWidget.isSmallScreen(context)
            ? PreferredSize(
            child: CurvedNavigationBar(
              index: page,
              backgroundColor: AppColors.greyLightColor,
              color: AppColors.beigeColor,
              buttonBackgroundColor: Colors.transparent,
              height: 70.0,
              items: [
                TextTitreBouton("Accueil", fontWeight: FontWeight.w400,),
                TextTitreBouton("Recherche", fontWeight: FontWeight.w400,),
                TextTitreBouton("Profil", fontWeight: FontWeight.w400,),
              ],
              onTap: (index){
                setState(() {
                  page = index;
                });
              },
            ),
            preferredSize: Size(screenSize.width, 70)
        )
            : null,
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
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  Widget showPage(){
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