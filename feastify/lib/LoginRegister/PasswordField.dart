import 'package:flutter/material.dart';
class PasswordField extends StatefulWidget {
  const PasswordField({Key? key, required this.controller,required this.label,this.confirmWithController}) : super(key: key);
  final TextEditingController controller;
  final String label;
  final TextEditingController? confirmWithController;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible=true;
  late String passwordValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          labelText: widget.label,//"Enter your password",
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
          prefixIcon: Icon(Icons.lock_open_rounded),
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              isVisible=!isVisible;
            });
          },
              icon: isVisible?Icon(Icons.visibility):Icon(Icons.visibility_off))
      ),
      obscureText: isVisible,
      validator: (value){
        if(value==null||value.isEmpty||value.length<6){
          return "⚠ Enter Atleast 6 Characters";
        }
        if (widget.confirmWithController != null &&
            value != widget.confirmWithController!.text) {
          return "⚠ Passwords do not match";
        }
        if(!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)){
          return "⚠ Must contain atleast 1 special characters";
        }

        return null;
      },
    );
  }
}


