import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/library/widgets/photo_profile.dart';
import 'package:new_explorer_challenge/library/widgets/take_photo_profil.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/user.dart';
import 'package:new_explorer_challenge/values/values.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:path/path.dart';


// ignore: must_be_immutable
class ParametreProfilPage extends StatefulWidget {

  UserClass user;

  ParametreProfilPage(this.user);

  @override
  _ParametreProfilPageState createState() => _ParametreProfilPageState();
}

class _ParametreProfilPageState extends State<ParametreProfilPage> {

  bool isMe = false;
  ScrollController controller;
  TextEditingController _pseudo;

  Uri imageWeb;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _pseudo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.blackLightColor,
        title: Container(
            height: 100,
            width: 100,
            child: Image.asset("assets/logo_NEC_.png")
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15.0, bottom: 10.0, top: 10.0),
            width: 30,
            height: 30,
            child: FloatingActionButton(
              child: Icon(Icons.clear, color: AppColors.blackLightColor,),
              backgroundColor: AppColors.beigeColor,
              onPressed: (){
                setState(() {
                  Navigator.pop(context);
                });
              },
            )
          ),
        ],
      ),
      backgroundColor: AppColors.greyLightColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseClass().fireUser.snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(backgroundColor: AppColors.beigeColor,),);
          }
          return SingleChildScrollView(
            child: InkWell(
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
                                if(Theme.of(context).platform != TargetPlatform.android || Theme.of(context).platform != TargetPlatform.iOS || Theme.of(context).platform != TargetPlatform.fuchsia){
                                  takePictureWeb();
                                }else{
                                  TakePhotoProfil(context, widget.user).changePictureUser();
                                }
                              },
                              child: (widget.user.photoProfil == "")
                              ? Icon(Icons.add_a_photo_rounded, color: AppColors.blackLightColor, size: 25.0,)
                              : null,
                            ),
                          ),
                        ),
                      ),
                      //Pseudo
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: TextTitreBouton(
                          "${widget.user.pseudo}",
                          fontSize: 20.0,
                        ),
                      ),
                      //Modifier profil
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(Elusive.pencil, color: AppColors.greyLightColor, size: 15,),
                                  backgroundColor: AppColors.blackLightColor,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10.0, right: 100.0),child: TextTitreBouton("Modifier le profil", fontWeight: FontWeight.w500,)),
                              Icon(Icons.keyboard_arrow_right, color: Colors.grey[350],)
                            ],
                          ),
                        ),
                        onTap: (){

                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.0, bottom: 15.0, left: 20.0),
                        height: 1.0,
                        width: 260,
                        color: Colors.grey[350],
                      ),
                      //Paramètre du compte
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(Icons.build_rounded, color: AppColors.greyLightColor, size: 20,),
                                  backgroundColor: AppColors.blackLightColor,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10.0, right: 50.0),child: TextTitreBouton("Paramètres du compte", fontWeight: FontWeight.w500,)),
                              Icon(Icons.keyboard_arrow_right, color: Colors.grey[350],)
                            ],
                          ),
                        ),
                        onTap: (){

                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.0, bottom: 15.0, left: 20.0),
                        height: 1.0,
                        width: 260,
                        color: Colors.grey[350],
                      ),
                      //Confidentialité des données
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(Icons.lock, color: AppColors.greyLightColor, size: 20,),
                                  backgroundColor: AppColors.blackLightColor,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),child: TextTitreBouton("Confidentialité des données", fontWeight: FontWeight.w500,)),
                              Icon(Icons.keyboard_arrow_right, color: Colors.grey[350],)
                            ],
                          ),
                        ),
                        onTap: (){

                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.0, bottom: 15.0, left: 20.0),
                        height: 1.0,
                        width: 260,
                        color: Colors.grey[350],
                      ),
                      //Déconnexion
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(Icons.power_settings_new, color: AppColors.greyLightColor, size: 20,),
                                  backgroundColor: AppColors.blackLightColor,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10.0, right: 140.0),child: TextTitreBouton("Déconnexion", fontWeight: FontWeight.w500,)),
                              Icon(Icons.keyboard_arrow_right, color: Colors.grey[350],)
                            ],
                          ),
                        ),
                        onTap: (){
                          logOut(context);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.0, left: 20.0),
                        height: 1.0,
                        width: 260,
                        color: Colors.grey[350],
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

  Future takePictureWeb() async{

    ImagePickerWeb.getImageInfo.then((MediaInfo mediaInfo){
      uploadFile(mediaInfo, 'images', mediaInfo.fileName);
    });
  }

  Future<Uri> uploadFile(MediaInfo mediaInfo, String ref, String fileName) async{
    try{
      String mimeType = mime(basename(mediaInfo.fileName));
      var metaData = UploadMetadata(contentType: mimeType);
      StorageReference storageReference = storage().ref(ref).child("storie_home/$fileName");

      UploadTaskSnapshot uploadTaskSnapshot = await storageReference.put(mediaInfo.data, metaData).future;
      Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      setState(() {
        imageWeb = imageUri;
        FirebaseClass().modifyFirebaseUser({
          keyPhotoProfil: imageWeb.toString(),
        });
      });
      return imageWeb;
    }catch(e){
      print("File upload error: $e");
      return null;
    }
  }

  Future<void> logOut(BuildContext context){
    TextTitreBouton title = TextTitreBouton(
      "Déconnexion",
    );

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          title: title,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          content: TextParagraphe(
            "Voulez-vous vous déconnectez ?"
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: TextTitreBouton(
                "Non"
              ),
            ),
            TextButton(
              onPressed: (){
                FirebaseClass().logOut();
                Navigator.pop(context);
              },
              child: TextTitreBouton(
                  "Oui"
              ),
            ),
          ],
        );
      }
    );
  }
}
