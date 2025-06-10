import 'package:flutter/material.dart';
import 'package:todo/constants.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool obscureText;
  final VoidCallback onToggle;
   PasswordTextField({super.key,required this.passwordController, required this.obscureText, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: passwordController,
      obscureText: obscureText,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Password',
        labelStyle:
        TextStyle(color: kPurpleColor, fontSize: 15),
        floatingLabelStyle: TextStyle(color: kPurpleColor),
        hintText: 'Enter password',
        hintStyle:
        TextStyle(color: Colors.grey, fontSize: 15),
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
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: kPurpleColor,
          ),
          onPressed: onToggle,
        ),
      ),

    );
  }
}
