import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:todo/components/snackbar_message.dart';
import 'package:http/http.dart' as http;
import 'package:todo/config.dart';

class DeleteUserTodo{
  static Future<bool> deleteUserTodoById(String id, BuildContext context) async{
    try{
      final response=await http.delete(Uri.parse(deleteTodoUrlById+id));

      var recievedResponse=jsonDecode(response.body);
      if (recievedResponse["success"]){
        SnackbarMessage.showSnackbar(context, message: recievedResponse["message"]);
        return true;
      }
      else{
        SnackbarMessage.showSnackbar(context, message: recievedResponse["message"]);
        return false;
      }
    }
    catch(error){
      print("Error occured while deleting todos @deleteUserTodoById");
      print(error);
      return false;
    }


  }
}