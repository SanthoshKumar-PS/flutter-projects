import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:todo/config.dart';
import 'package:todo/providers/fetchtodo/todomodel.dart';

class FetchTodoProvider with ChangeNotifier{
   bool _isLoading=true;
   List<TodoModel> _todosList=[];
   int _todosCount=0;
   int _todoCompletedCount=0;
   int _todoPendingCount=0;

   List<TodoModel> get todoList => _todosList;
   int get todoCount => _todosCount;
   int get todoCompletedCount => _todoCompletedCount;
   int get todoPendingCount => _todoPendingCount;
   bool get isLoading => _isLoading;

   Future<List<TodoModel>> loadUserTodos(String userId) async{
     _isLoading=true;
     notifyListeners();
     try{
       final response=await http.get(
           Uri.parse(fetchTodoUrl+userId)
       );
       var recievedResponse=jsonDecode(response.body);
       if (recievedResponse["success"]){
         _todosList = (recievedResponse["todos"] as List)
             .map((todoJson) => TodoModel.fromJson(todoJson))
             .toList();

         _todoCompletedCount = _todosList.where((todo) => todo.status == "completed").length;
         _todoPendingCount = _todosList.where((todo) => todo.status == "pending").length;

         _todosCount = _todosList.length;
         notifyListeners();

         print("FetchTodoProdiver => Fetched todos : $_todosList");
         _isLoading=false;
         return _todosList;
       }
       return [];
     }
     catch(error){
       print("FetchTodoProdiver => Fetch todo error");
       print(error);
       _isLoading=false;
       return [];
     }
   }
}