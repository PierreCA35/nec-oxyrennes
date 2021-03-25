
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';

class UserClass{

  String uid;
  DocumentReference ref;
  String documentId;
  String email;
  String pseudo;
  String photoProfil;
  String description;
  String tag1;
  String tag2;
  String tag3;
  String tag4;
  String tag5;
  String tag6;
  String tag7;
  String tag8;

  UserClass(DocumentSnapshot snapshot){
    ref = snapshot.reference;
    documentId = snapshot.id;
    Map<String, dynamic> map = snapshot.data();
    uid = map[keyUid];
    email = map[keyEmail];
    pseudo = map[keyPseudo];
    photoProfil = map[keyPhotoProfil];
    description = map[keyDescription];
    tag1 = map[keyTag1];
    tag2 = map[keyTag2];
    tag3 = map[keyTag3];
    tag4 = map[keyTag4];
    tag5 = map[keyTag5];
    tag6 = map[keyTag6];
    tag7 = map[keyTag7];
    tag8 = map[keyTag8];
  }

  Map<String, dynamic> toMap(){
    return{
      keyUid: uid,
      keyEmail: email,
      keyPseudo: pseudo,
      keyPhotoProfil: photoProfil,
      keyDescription: description,
      keyTag1: tag1,
      keyTag2: tag2,
      keyTag3: tag3,
      keyTag4: tag4,
      keyTag5: tag5,
      keyTag6: tag6,
      keyTag7: tag7,
      keyTag8: tag8,
    };
  }
}