

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:mime_type/mime_type.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/values/values.dart';
import 'package:path/path.dart';

//import 'package:universal_html/html.dart' as html;

class AjouterContenu extends StatefulWidget {
  @override
  _AjouterContenuState createState() => _AjouterContenuState();
}

class _AjouterContenuState extends State<AjouterContenu> {

  TextEditingController titre;
  TextEditingController description;
  TextEditingController localisation;
  TextEditingController tag;

  File photo;

  Uri imageWeb;


  @override
  void initState() {
    super.initState();
    titre = TextEditingController();
    description = TextEditingController();
    localisation = TextEditingController();
    tag = TextEditingController();
  }

  @override
  void dispose() {
    titre.dispose();
    description.dispose();
    localisation.dispose();
    tag.dispose();
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
                Navigator.pop(context);
              },
            )
          ),
        ],
      ),
      backgroundColor: AppColors.greyLightColor,
      body: Container(
        margin: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          focusColor: Colors.grey[100],
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SafeArea(
            child: Column(
              children: [
                //Photo et bouton pour ajouter ou changer la photo
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Card(
                          elevation: 3.0,
                          child: (imageWeb != null && photo == null)
                              ? Image.network(imageWeb.toString())
                              : (photo != null && imageWeb == null)
                              ? Image.file(photo)
                              : null),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: AppColors.blackLightColor,
                            ),
                            onPressed: (){
                              if (Theme.of(context).platform != TargetPlatform.iOS || Theme.of(context).platform != TargetPlatform.android || Theme.of(context).platform != TargetPlatform.fuchsia) {
                                takePictureWeb();
                              } else {
                                takePicture(ImageSource.camera);
                              }
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        width: 30,
                        height: 30,
                        child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo_rounded,
                            color: AppColors.blackLightColor,
                          ),
                          onPressed: () {
                            if (Theme.of(context).platform != TargetPlatform.iOS || Theme.of(context).platform != TargetPlatform.android || Theme.of(context).platform != TargetPlatform.fuchsia) {
                              takePictureWeb();
                            } else {
                              takePicture(ImageSource.camera);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //Champ Titre
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: TextField(
                        controller: titre,
                        decoration: InputDecoration(
                          hintText: "Titre",
                          hintStyle: TextStyle(
                            color: AppColors.blackLightColor,
                            fontWeight: FontWeight.bold
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.0,
                              style: BorderStyle.none
                            )
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.0,
                              style: BorderStyle.none
                            ),
                          ),
                          suffixIcon: Icon(Icons.title, color: AppColors.blackLightColor,)
                        ),
                        cursorColor: AppColors.blackLightColor,
                      ),
                    ),
                  ),
                ),
                //Champ Description
                Container(
                  height: 130.0,
                  margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: TextField(
                        controller: description,
                        maxLines: 8,
                        minLines: 1,
                        decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(
                                color: AppColors.blackLightColor,
                                fontWeight: FontWeight.bold
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 0.0,
                                    style: BorderStyle.none
                                )
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.0,
                                  style: BorderStyle.none
                              ),
                            ),
                            suffixIcon: Icon(Elusive.pencil, size: 18, color: AppColors.blackLightColor,)
                        ),
                        cursorColor: AppColors.blackLightColor,
                      ),
                    ),
                  ),
                ),
                //Champs Localisation et Tag
                Row(
                  children: [
                    Container(
                      width: 160,
                      child: Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: TextField(
                            controller: localisation,
                            decoration: InputDecoration(
                                hintText: "Localisation",
                                hintStyle: TextStyle(
                                    color: AppColors.blackLightColor,
                                    fontWeight: FontWeight.bold
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0.0,
                                        style: BorderStyle.none
                                    )
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.0,
                                      style: BorderStyle.none
                                  ),
                                ),
                                suffixIcon: Icon(Icons.pin_drop_rounded, color: AppColors.blackLightColor,)
                            ),
                            cursorColor: AppColors.blackLightColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: TextField(
                            controller: tag,
                            decoration: InputDecoration(
                                hintText: "Tag",
                                hintStyle: TextStyle(
                                    color: AppColors.blackLightColor,
                                    fontWeight: FontWeight.bold
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0.0,
                                        style: BorderStyle.none
                                    )
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 0.0,
                                      style: BorderStyle.none
                                  ),
                                ),
                                suffixIcon: Icon(Icons.assistant_photo_sharp, color: AppColors.blackLightColor,)
                            ),
                            cursorColor: AppColors.blackLightColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.blackLightColor
                          ),
                        ),
                        child: TextTitreBouton(
                          "Publier",
                          fontSize: 16.0,
                          color: AppColors.greyLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () async{
                          String id = DateTime.now().millisecondsSinceEpoch.toString();
                         if(photo == null && imageWeb != null && titre.text != ""){
                            FirebaseFirestore.instance.collection("carnet").doc(me.uid).collection(me.uid).doc(id).set({
                              "titre": titre.text,
                              "description": description.text,
                              "photo": imageWeb.toString(),
                              "tag1": tag.text,
                              "localisation": localisation.text,
                              "date": dateSecond().toString(),
                              "id": id,
                            });
                            FirebaseFirestore.instance.collection("home").doc(id).set({
                              "titre": titre.text,
                              "description": description.text,
                              "photo": imageWeb.toString(),
                              "tag1": tag.text,
                              "localisation": localisation.text,
                              "date": dateSecond().toString(),
                              "auteur": me.pseudo,
                              "id": id,
                            });
                          }else if(imageWeb == null && photo != null && titre.text != ""){
                           FirebaseFirestore.instance.collection("carnet").doc(me.uid).collection(me.uid).doc(id).set({
                             "titre": titre.text,
                             "description": description.text,
                             "photo": photoHome,
                             "tag1": tag.text,
                             "localisation": localisation.text,
                             "date": dateSecond().toString(),
                             "id": id,
                           });
                           FirebaseFirestore.instance.collection("home").doc(id).set({
                             "titre": titre.text,
                             "description": description.text,
                             "photo": photoHome,
                             "tag1": tag.text,
                             "localisation": localisation.text,
                             "date": dateSecond().toString(),
                             "auteur": me.pseudo,
                             "id": id,
                           });
                          }else{
                           return null;
                          }
                         Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future takePicture(ImageSource source) async{
    File file = File(await ImagePicker().getImage(source: source, imageQuality: 20, preferredCameraDevice: CameraDevice.front).then((value) => value.path));

    FirebaseClass().modifiyPhotoHome(photo);

    setState(() {
      photo = file;
    });
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
      });
      return imageWeb;
    }catch(e){
      print("Fle upload error: $e");
      return null;
    }
  }

  dateSecond(){
    var dateNow = int.parse(DateFormat('yyyyMMddHHmmss').format(DateTime.now()));

    return dateNow;
  }
}
