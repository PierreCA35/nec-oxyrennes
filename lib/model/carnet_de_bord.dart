
import 'package:cloud_firestore/cloud_firestore.dart';

class CarnetDeBord{

  String titre;
  String description;
  String photo;
  String date;
  String tag1;
  String tag2;
  DocumentReference ref;
  String documentId;

  CarnetDeBord(DocumentSnapshot snapshot){
    ref = snapshot.reference;
    documentId = snapshot.id;
    Map<String, dynamic> map = snapshot.data();
    titre = map["titre"];
    description = map["description"];
    photo = map["photo"];
    date = map["date"];
    tag1 = map["tag1"];
    tag2 = map["tag2"];
  }

  Map<String, dynamic> toMap(){
    return{
      "titre": titre,
      "description": description,
      "photo": photo,
      "date": date,
      "tag1": tag1,
      "tag2": tag2
    };
  }
}