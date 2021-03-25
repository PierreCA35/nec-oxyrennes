
import 'dart:io';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:new_explorer_challenge/library/widgets/toast.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';

class Firebase{

  final authinstance = FirebaseAuth.instance;
  static final firestoreInstance = FirebaseFirestore.instance;
  final fireUser = firestoreInstance.collection("users");

  //Creation de compte
  // ignore: missing_return
  Future<UserCredential> createAccount(String email, String pwd, String pseudo) async{
    try{
      UserCredential user = await authinstance.createUserWithEmailAndPassword(email: email, password: pwd);
      String uid = user.user.uid;
      Map<String, dynamic> map = {
        keyUid: uid,
        keyPseudo: pseudo,
        keyEmail: email,
        keyPhotoProfil: "",
        keyDescription: "",
        keyTag1: "",
        keyTag2: "",
        keyTag3: "",
        keyTag4: "",
        keyTag5: "",
        keyTag6: "",
        keyTag7: "",
        keyTag8: "",
      };
      addUserFirebase(uid, map, email, pseudo);
      return user;
    }on FirebaseAuthException catch(e){
      if("invalid-email" == e.code){
        ToastMessage("Email invalide");
      }
      if("weak-password" == e.code){
        ToastMessage("Mot de passe incorrect");
      }
      if("email-already-in-use" == e.code){
        ToastMessage("Email invalide");
      }
    }catch(e){
      return null;
    }
  }

  addUserFirebase(String uid, Map<String, dynamic> map, String email, String pseudo){
    fireUser.doc(uid).set(map);
  }

  //Utiliser un compte existant
  // ignore: missing_return
  Future<UserCredential> connectAccount(String email, String pwd) async{
    try{
      final UserCredential user = await authinstance.signInWithEmailAndPassword(email: email, password: pwd);
      return user;
    }on FirebaseAuthException catch(e){
      if("user_not_found" == e.code){
        ToastMessage("");
      }
      if("wrong-password" == e.code){
        ToastMessage("");
      }
      if("invalid-email" == e.code){
        ToastMessage("");
      }
    }catch(e){
      return null;
    }
  }

  modifyFirebaseUser(Map<String, dynamic> data){
    fireUser.doc(me.uid).update(data);
  }

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

  //Storage Image

  static final storageInstance = FirebaseStorage.instance.ref();
  final storageUser = storageInstance.child("ImageProfil");

  //Stockage de l'image de profil dans Firebase Storage
  Future<String> addImageProfil (File file, Reference ref) async{
    UploadTask task = ref.putFile(file);
    await task.whenComplete((){
      return;
    });
    return ref.getDownloadURL();
  }

  modifyImageProfil(File file){
    Reference ref = storageUser.child(me.uid);
    addImageProfil(file, ref).then((value){
      Map<String, dynamic> data ={
        keyPhotoProfil: value,
      };
      modifyFirebaseUser(data);
    });
  }
}