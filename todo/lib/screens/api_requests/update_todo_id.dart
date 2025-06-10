import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todo/components/snackbar_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:todo/config.dart';

class UpdateTodoId{
  static Future<bool> updateTodoByUserIdTodoId(String userId,String id,String status,BuildContext context) async{
    final response=await http.put(
        Uri.parse(updateUserStatusUrl),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({
          "id":id,
          "userId":userId,
          "status":status
        })
    );

    var recievedResponse=jsonDecode(response.body);
    if(recievedResponse["success"]){
      SnackbarMessage.showSnackbar(context, message: recievedResponse["message"]);
      return true;
    }
    else{
      SnackbarMessage.showSnackbar(context, message: recievedResponse["message"],backgroundColor: Colors.red.shade500);
      return false;
    }
  }
}
