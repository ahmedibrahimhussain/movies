import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<void> customToast(String msg, ToastStatus status) async {
  await Fluttertoast.showToast(
    msg: msg,
    backgroundColor: status == ToastStatus.success
        ? Colors.green
        : status == ToastStatus.error
            ? Colors.red
            : Colors.amber,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
  );
}

enum ToastStatus {
  success,
  warning,
  error,
}
