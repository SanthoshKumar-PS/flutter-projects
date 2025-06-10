import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../components/snackbar_message.dart';
import '../../config.dart';
import '../dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController{

  static void registerUser(String email,String name, String password,BuildContext context) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        final response = await http.post(
            Uri.parse(registrationUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              "email": email.trim(),
              "name":name.trim(),
              "password": password.trim()
            })
        );
        var recievedResponse=jsonDecode(response.body);
        print(recievedResponse['message']);
        if(recievedResponse['success']){
          SnackbarMessage.showSnackbar(
              context,
              message: recievedResponse['message']
          );
          var myToken=recievedResponse['result'];
          Map<String,dynamic> decodedToken=JwtDecoder.decode(myToken);
          print(decodedToken);
          SharedPreferences prefs=await SharedPreferences.getInstance();
          prefs.setString('userId',decodedToken['_id']);
          prefs.setString('userName', decodedToken['name']);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
        }
        else{
          SnackbarMessage.showSnackbar(
              context,
              message: recievedResponse['message'],
              backgroundColor: Colors.red.shade500
          );
        }

      }
    }
    catch (err) {
      print("Error has been occured");
      print(err.toString());
    }
  }

}