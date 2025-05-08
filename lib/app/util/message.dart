import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void Showmessage(
  BuildContext context,
  String message, {
  required IconData icon,
  required Color backgroundColor,
  Duration duration = const Duration(seconds: 3),
}) {
  Flushbar(
    message: message,
    duration: duration,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: backgroundColor,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    borderRadius: BorderRadius.circular(8),
    icon: Icon(
      icon,
      color: Colors.white,
    ),
  ).show(context);
}
