
import 'package:cloud_firestore/cloud_firestore.dart';

class Home{

  DocumentReference ref;
  String documentId;
  String id;
  String auteur;
  String date;
  String description;
  String localisation;
  String photo;
  String tag1;
  String titre;

  Home(DocumentSnapshot snapshot){
    ref = snapshot.reference;
    documentId = snapshot.id;
    Map<String, dynamic> map = snapshot.data();
    id = map["id"];
    auteur = map["auteur"];
    date = map["date"];
    description = map["description"];
    localisation = map["localisation"];
    photo = map["photo"];
    tag1 = map["tag1"];
    titre = map["titre"];
  }

  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "auteur": auteur,
      "date": date,
      "description": description,
      "localisation": localisation,
      "photo": photo,
      "tag1": tag1,
      "titre": titre,
    };
  }
}