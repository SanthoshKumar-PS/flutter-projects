import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';


bool checkSecurity=true;
Widget buildPasswordField({
  required  String label,
  required String hint,
  required bool obscureText,
  required VoidCallback onPressed,
  required TextEditingController controller,
  required String? Function(String? value) validate,
})
{
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      filled: true,
      fillColor: kWhite,
      hintText: hint,
      hintStyle: const TextStyle(
          color: kMediumGrey, fontSize: 15),
      labelText: label,
      labelStyle: const TextStyle(
          fontSize: 15, color: Colors.blue),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFEEEFF0), width: 2), // Green on focus
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFEEEFF0),width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.blue, width: 2), // Green on focus
      ),
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: Icon(obscureText
            ? Icons.visibility_off
            : Icons.visibility),color: Colors.blue,
      ),
    ),
    obscureText: obscureText,
    validator: validate,
  );
}