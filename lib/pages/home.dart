import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/datas.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/hero_detail.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/hero_widgets.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/home.dart';
import 'package:new_explorer_challenge/pages/ajouter_contenu.dart';
import 'package:new_explorer_challenge/pages/log_sign/login_signup_page.dart';
import 'package:new_explorer_challenge/values/values.dart';

 /*const String random0 = 'https://picsum.photos/207/300/?random';
 const String random1 = 'https://picsum.photos/207/300/?random';
 const String random2 = 'https://picsum.photos/207/300/?random';
 const String random3 = 'https://picsum.photos/207/300/?random';
 const String random4 = 'https://picsum.photos/207/300/?random';*/

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  bool get mounted => super.mounted;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async{
    Timer(Duration(seconds: 2), () async{
      return await popUpConcours();
    });
  }

  Future<void> popUpConcours() async{
    return await showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Color.fromRGBO(245, 245, 249, 0.2),
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          title: Container(
            height: 300,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.cancel),
                    iconSize: 30,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(
                    "assets/calendar_star.png",
                  ),
                ),
                TextTitreBouton(
                  "Découvrez nos évènements",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  height: 50,
                  width: 220,
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: ElevatedButton(
                    child: TextTitreBouton(
                      "Challenge Réflexion",
                      color: AppColors.greyLightColor,
                    ),
                    onPressed: (){
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.blackLightColor)
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 220,
                  child: ElevatedButton(
                    child: TextTitreBouton(
                      "Défi Sportif",
                      color: AppColors.greyLightColor,
                    ),
                    onPressed: (){
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.blackLightColor)
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/logo_NEC_.png")
          ),
          backgroundColor: AppColors.blackLightColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            backgroundColor: AppColors.blackLightColor,
            child: Icon(Icons.add_rounded, color: AppColors.beigeColor, size: 40,),
            onPressed: (){
              if (me == null){
                return Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignUpPage()));
              }else{
                return Navigator.push(context, MaterialPageRoute(builder: (context) => AjouterContenu()));
              }
            },
          ),
        ),
        body: streamBuilder(),
    );
  }

  Widget streamBuilder(){
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("home").orderBy("date", descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot>snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            itemCount: snapshot.data.size,
            itemBuilder: (context, index){
              Home homeBorde = new Home(snapshot.data.docs[index]);
              HeroWidget hero = HeroWidget(homeBorde.photo);
              return _ImageTile(homeBorde.photo, homeBorde, hero, homeBorde.titre, homeBorde.description);
            },
            staggeredTileBuilder: (index){
              return new StaggeredTile.count(
                2,
                index.isEven ? 2 : 2,
              );
            },
          );
        }
      },
    );
  }
}

class _ImageTile extends StatelessWidget{

  const _ImageTile(this.gridCard, this.homeBorde, this.hero, this.titre, this.description);
  final gridCard;
  final HeroWidget hero;
  final Home homeBorde;
  final String titre;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(3.0),
      child: ExpansionCard(
        borderRadius: 5.0,
        backgroundColor: Color.fromRGBO(245, 245, 249, 0.6),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color.fromRGBO(255, 218, 187, 0.6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitreBouton(titre),
            ],
          ),
        ),
        background: Container(
          height: 170,
          child: Image.network(gridCard, fit: BoxFit.cover,)
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: TextParagraphe(
              (homeBorde.description.length <= 60)
              ? homeBorde.description
              : "${homeBorde.description.substring(0, 59)}...",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(3.0),
              width: 35,
              height: 35,
              child: FloatingActionButton(
                backgroundColor: AppColors.blackLightColor,
                child: Icon(Icons.search, color: AppColors.beigeColor,),
                onPressed: (){
                  Datas().pusher(context, titre, HeroDetailHomeBord(homeBorde, hero));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}