import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo/config.dart';
import 'package:todo/components/snackbar_message.dart';

class CreateTodoController{
  static void addNewTodo(String userId,String category,String title,String description,String notes,BuildContext context) async{
    try{
      final response=await http.post(
        Uri.parse(addTodoUrl),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({
          "userId": userId,//"6831b3fb9c7037ed73cd8d35" ,
          "category":category,
          "title": title,
          "description":description,
          "notes":notes
        })
      );
    var recievedResponse=jsonDecode(response.body);
    if(recievedResponse['success']){
      SnackbarMessage.showSnackbar(
          context,
          message:recievedResponse['message']
      );
      Navigator.pop(context,true);
    }
    else{
      SnackbarMessage.showSnackbar(
          context,
          message:recievedResponse['message'],
          backgroundColor: Colors.red.shade500
      );
      Navigator.pop(context,false);


    }

    }
    catch(error){
      print(error);
      print("Some error has occured while creating a new todo");
    }
  }
}