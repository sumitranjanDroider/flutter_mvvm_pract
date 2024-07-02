import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessages(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT);
  }

  static void flushBarErrorMessages(String message,BuildContext context){
    showFlushbar(context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: EdgeInsets.all(15),
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeOut,
        positionOffset: 20,
        icon: Icon(Icons.error,size: 28,color: Colors.white,),
    )..show(context),
    );
  }
  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),
      backgroundColor: Colors.red,),
    );
  }
}