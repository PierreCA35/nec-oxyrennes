
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastMessage{
  final String text;

  ToastMessage(this.text);

  toastMessage(){
    return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
    );
  }
}