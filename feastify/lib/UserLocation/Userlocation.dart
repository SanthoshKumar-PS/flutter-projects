import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
class Userlocation{
  double? latitude;
  double? longitude;
  String? url;
  final String apiKey="870a04c755bc71854ca2b3cfd71acfec";
  String cityName="error";

  Future<bool> getUserCity(cityName) async{
    try{
      String apiKey="870a04c755bc71854ca2b3cfd71acfec";
      String url='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
      http.Response response=await http.get(Uri.parse(url));
      var data=response.body;
      var decodedData=jsonDecode(data);
      latitude=decodedData['coord']['lat'];
      longitude=decodedData['coord']['lon'];
      if (latitude != null && longitude != null &&
          latitude! >= -90 && latitude! <= 90 &&
          longitude! >= -180 && longitude! <= 180)
      {
        return true;
      }
      else{
        print("In the else");
        return false;
      }
    }
    catch(e){
      return false;
    }

  }
  Future getLocation() async{
    LocationPermission permission=await Geolocator.checkPermission();
    if(permission==LocationPermission.denied||permission==LocationPermission.deniedForever)
      {
        permission=await Geolocator.requestPermission();
        return;
      }
    if(permission==LocationPermission.always||permission==LocationPermission.whileInUse)
      {
        Position position=await Geolocator.getCurrentPosition();
        latitude=position.latitude;
        longitude=position.longitude;
        //print('$latitude $longitude');

       url="https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}";

       http.Response response=await http.get(Uri.parse(url!));
       //print(response.body);
       if(response.statusCode==200)
         {
           var parsedData=response.body;
           var decodedData=jsonDecode(parsedData);
           cityName=decodedData['name'];
           //print(cityName);
         }

      }


  }
}