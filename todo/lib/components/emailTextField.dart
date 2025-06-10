import 'package:flutter/material.dart';
import 'package:todo/constants.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final String labelText;
  final String hintText;
  const EmailTextField({super.key,required this.emailController, required this.labelText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle:
        TextStyle(color: kPurpleColor, fontSize: 15),
        floatingLabelStyle: TextStyle(color: kPurpleColor),
        hintText: hintText,
        hintStyle:  TextStyle(color: Colors.grey, fontSize: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPurpleColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
