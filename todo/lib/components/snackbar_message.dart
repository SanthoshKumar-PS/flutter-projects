import 'package:flutter/material.dart';
import 'package:todo/constants.dart';

class SnackbarMessage {
  static void showSnackbar(
      BuildContext context, {
        required String message,
        backgroundColor = Colors.green,
        Duration duration = const Duration(milliseconds: 1500),
        String? actionLabel,
        VoidCallback? onActionPressed,
      }) {
    final snackBar = SnackBar(
      content: Center(child: Text(message,style: kTodoHeader,)),
      backgroundColor: backgroundColor,
      duration: duration,
      action: actionLabel != null
          ? SnackBarAction(
        label: actionLabel,
        onPressed: onActionPressed ?? () {},
        textColor: Colors.white,
      )
          : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
