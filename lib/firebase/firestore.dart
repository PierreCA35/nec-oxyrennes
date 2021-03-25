import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/toast.dart';

class Firebase{

  final authinstance = FirebaseAuth.instance;

  //Creation de compte
  Future<UserCredential> createAccount(String email, String pwd, String pseudo) async{
    try{
      UserCredential user = await authinstance.createUserWithEmailAndPassword(email: email, password: pwd);
      String uid = user.user.uid;
      Map<String, dynamic> map = {
        "pseudo": pseudo,
        "email": email,
        "uid": uid,
        "photoProfil": "",
        "description": "",
        "tag1": "",
        "tag2": "",
        "tag3": "",
        "tag4": "",
        "tag5": "",
        "tag6": "",
        "tag7": "",
        "tag8": "",
      };

    }on FirebaseAuthException catch(e){

    }catch(e){
      return null;
    }
  }

  //Utiliser un compte existant


  //Déconnexion
  logOut() => authinstance.signOut();

  //Mot de passe oublié
  Future<void> changePassword(String mail) async{
    try{
      await authinstance.sendPasswordResetEmail(email: mail);
    }on FirebaseAuthException catch(e){
      if("invalid-email" == e.code){
        ToastMessage("Email incorrect");
      }else{
        ToastMessage("Email incorrect");
      }
    }catch(e){
      return null;
    }
  }
}