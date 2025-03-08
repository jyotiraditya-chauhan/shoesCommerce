import 'package:flutter/material.dart';

showSnakeBar(BuildContext context, String message, Color? bgColor) {
  final snackBar = SnackBar(
    backgroundColor: bgColor ?? Colors.black,
    content: Text(
      message,
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    action: SnackBarAction(
      label: 'Close',
      textColor: Colors.white,
      disabledBackgroundColor: Colors.transparent,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
