import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/library/widgets/photo_profile.dart';
import 'package:new_explorer_challenge/library/widgets/take_photo_profil.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
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
    subscription = new Firebase().fireUser.doc(widget.user.uid).snapshots().listen((data){
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
      backgroundColor: AppColors.greyLightColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: Firebase().fireUser.snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(backgroundColor: AppColors.beigeColor,),);
          }
          return SingleChildScrollView(
            child: InkWell(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  child: Column(
                    children: [
                      //Photo Profil
                      Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: ProfilPhoto(
                            urlImage: widget.user.photoProfil,
                            onPressed: (){
                              TakePhotoProfil(context, widget.user).changePictureUser();
                            },
                            child: (widget.user.photoProfil == "")
                            ? Icon(Icons.add_a_photo_rounded, color: AppColors.blackLightColor, size: 25.0,)
                            : null,
                          ),
                        ),
                      ),
                      //Pseudo
                      TextTitreBouton(
                        "${widget.user.pseudo}",
                        fontSize: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
