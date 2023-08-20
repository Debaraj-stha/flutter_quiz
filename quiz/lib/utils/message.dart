import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void messageToUser(String message) {
  Fluttertoast.showToast(
    // timeInSecForIosWeb: 1
    toastLength: Toast.LENGTH_LONG,
    webShowClose: true,
      msg: message,
      gravity: ToastGravity.BOTTOM,
      fontSize: 18,
      textColor: Colors.indigo,
      backgroundColor: Colors.white);
}
