import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking({required this.url});
  final String url;

  double? temperature;
  String? description;
  String? city;



  Future getData() async{

    http.Response response = await http.get(Uri.parse(url));
    // print(response.body);
    if(response.statusCode==200){
      String data=response.body;
         return jsonDecode(data);
    }
    else{
      print("Load Failed - ${response.statusCode}");
    }


  }
}