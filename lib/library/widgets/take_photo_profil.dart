
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/user.dart';
import 'package:new_explorer_challenge/values/values.dart';

import 'constants.dart';

class TakePhotoProfil{


  BuildContext context;
  UserClass user;

  TakePhotoProfil(this.context, this.user);

  Duration duration = new Duration(seconds: 1);

  changePictureUser() async{
    if(user.uid == me.uid){
      await showBottomSheet(
        context: context,
        builder: (ctx){
          return Container(
            color: Colors.transparent,
            child: Card(
              elevation: 6.0,
              margin: EdgeInsets.all(3.0),
              child: Container(
                height: 100.0,
                color: AppColors.beigeColor,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextTitreBouton("Modifier ma photo de profil"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Prendre une photo
                        IconButton(
                          icon: Icon(Icons.camera_alt_rounded),
                          onPressed: (){
                            takePicture(ImageSource.camera).catchError((e){
                              return null;
                            });
                            Navigator.pop(context);
                          },
                          color: AppColors.greyLightColor,
                        ),
                        //Importer une photo
                        IconButton(
                          icon: Icon(Icons.photo_library_rounded),
                          onPressed: (){
                            takePicture(ImageSource.gallery).catchError((e){
                              return null;
                            });
                            Navigator.pop(context);
                          },
                          color: AppColors.greyLightColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      );
    }
  }

  Future takePicture(ImageSource source) async{
    File file = File(await ImagePicker().getImage(source: source, imageQuality: 20, preferredCameraDevice: CameraDevice.front).then((value) => value.path));
    FirebaseClass().modifyImageProfil(file);
  }
}