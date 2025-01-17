import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static error(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
  }
}
