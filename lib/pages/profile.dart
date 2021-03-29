import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/datas.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/hero_detail.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/hero_widgets.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/library/widgets/photo_profile.dart';
import 'package:new_explorer_challenge/library/widgets/take_photo_profil.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/carnet_de_bord.dart';
import 'package:new_explorer_challenge/model/user.dart';
import 'package:new_explorer_challenge/values/values.dart';


// ignore: must_be_immutable
class ProfilPage extends StatefulWidget {

  UserClass user;

  ProfilPage(this.user);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  bool isMe = false;
  ScrollController controller;
  TextEditingController _pseudo;
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    isMe = (widget.user.uid == me.uid);
    controller = ScrollController()..addListener(() {
      setState(() {});
    });
    _pseudo = TextEditingController(text: me.pseudo);
    subscription = FirebaseFirestore.instance.collection("users").doc(widget.user.uid).snapshots().listen((data){
      setState(() {
        widget.user = UserClass(data);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _pseudo.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.blackLightColor,
        actions: [
          Container(
              margin: EdgeInsets.only(right: 15.0, bottom: 10.0, top: 10.0),
              width: 30,
              height: 30,
              child: FloatingActionButton(
                child: Icon(Icons.ac_unit, color: AppColors.blackLightColor,),
                backgroundColor: AppColors.beigeColor,
                onPressed: (){

                },
              )
          ),
        ],
      ),
      backgroundColor: AppColors.greyLightColor,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(backgroundColor: AppColors.beigeColor,),);
          }
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Column(
                  children: [
                    //Photo Profil
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: ProfilPhoto(
                            urlImage: widget.user.photoProfil,
                            size: 40.0,
                            onPressed: (){
                              TakePhotoProfil(context, widget.user).changePictureUser();
                            },
                            child: (widget.user.photoProfil == "")
                                ? Icon(Icons.add_a_photo_rounded, color: AppColors.blackLightColor, size: 25.0,)
                                : null,
                          ),
                        ),
                      ),
                    ),
                    //Pseudo
                    TextTitreBouton(
                      "${widget.user.pseudo}",
                      fontSize: 20.0,
                    ),
                    //Carnet de Bord,
                    Container(
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.only(top: 30.0),
                      child: streamBuilder(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget streamBuilder(){
   /*return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index){
        print(titre);
        //CarnetDeBord carnet = new CarnetDeBord(snapshot.data.documents[index]);
        return new Card(
          elevation: 6.0,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColors.greyLightColor),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors.greyLightColor,
            ),
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Column(
                children: [
                  TextTitreBouton(
                    "$titre",
                    color: AppColors.blackLightColor,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
   */
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('carnet').doc(me.uid).collection(me.uid).orderBy("date", descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot>snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: Text(""),);
        }else{
          /*return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot doc){
              return new Card(
                elevation: 6.0,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: AppColors.greyLightColor),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.greyLightColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: SafeArea(
                    child: Column(
                      children: [
                        TextTitreBouton(
                          doc.data()["titre"],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );*/
          return ListView.builder(
            itemCount: snapshot.data.size,
            itemBuilder: (context, index){
              CarnetDeBord carnet = new CarnetDeBord(snapshot.data.docs[index]);
              HeroWidget hero = HeroWidget(carnet.photo);
              return GestureDetector(
                onTap: (){
                  Datas().pusher(context, carnet.titre, HeroDetail(carnet, hero));
                },
                child: new Card(
                  elevation: 6.0,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: AppColors.greyLightColor),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.greyLightColor,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Titre + descriptif
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              width: 180,
                              height: 120,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: TextTitreBouton(
                                        carnet.titre,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextParagraphe(
                                      carnet.description,
                                      fontSize: 14,
                                      textAlign: TextAlign.left,
                                      maxLines: 4,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          //Photo
                          (carnet.photo != "")
                          ? Container(
                            width: 130,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: NetworkImage(carnet.photo)
                              )
                            ),
                          )
                          : Container(
                            width: 130,
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  /*Future getCarnetDeBord() async{
    var firestore = FirebaseFirestore.instance;

    QuerySnapshot listCarnetDeBord = await firestore.collection('carnetDeBord').doc(me.uid).collection(me.uid).get();

    return listCarnetDeBord.docs;
  }*/
}
