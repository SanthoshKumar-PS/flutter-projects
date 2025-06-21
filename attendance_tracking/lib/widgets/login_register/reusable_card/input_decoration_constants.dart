import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';

InputDecoration customInputDecoration(String label, String hint) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    filled: true,
    fillColor: kWhite,
    hintText: hint,
    hintStyle: const TextStyle(color: Color(0xFFB7B9BE), fontSize: 15),
    labelText: label,
    labelStyle: const TextStyle(fontSize: 15, color: kBlack),
    floatingLabelStyle: TextStyle(
      color: Colors.blue,
    ),
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
  );
}
