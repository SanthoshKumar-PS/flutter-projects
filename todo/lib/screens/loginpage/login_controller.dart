import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo/config.dart';
import '../../components/snackbar_message.dart';
import '../dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginController{
  static void loginUser(String email,String password, BuildContext context) async{
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        final response=await http.post(
            Uri.parse(loginUrl),
            headers: {'Content-Type':'application/json'},
            body: jsonEncode({
              "email":email.trim(),
              "password":password.trim()
            })
        );
        print(response.body);
        var recievedResponse=jsonDecode(response.body);
        if(recievedResponse['success']){
          SnackbarMessage.showSnackbar(
              context,
              message: recievedResponse['message']
          );
          String myToken=recievedResponse['result'];
          Map<String,dynamic> decodedToken=JwtDecoder.decode(myToken);
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
    catch(error){
      print(error);
    }
  }
}