import 'package:flutter/material.dart';

class TextfieldContact extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const TextfieldContact({super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
