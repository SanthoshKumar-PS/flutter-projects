import 'package:flutter/material.dart';
class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    super.key,
    required this.emailtextController,
  });

  final TextEditingController emailtextController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: emailtextController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Email',
          labelText: 'Enter your email',
          prefixIcon: Icon(Icons.login),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.green, width: 2), // Green on focus
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue,width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.green, width: 2), // Green on focus
          ),
        ),
        validator:(value){
          if(value==null||value.isEmpty)
          { return "Please enter your email address"; }
          if(!value.contains('@gmail.com')){
            return "⛔ Enter a valid email address";
          }
          // if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
          //   return "⚠ Avoid special characters address"; // Invalid format error
          // }

        });
  }
}
