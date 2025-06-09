import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_climateapp/services/location.dart';
import 'package:y_climateapp/services/networking.dart';
import 'location_screen.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
    // getLocation();
  }
  Future getPermission() async{
    LocationPermission permission=await Geolocator.checkPermission();

    if(permission==LocationPermission.denied||permission==LocationPermission.deniedForever){
      print('Permission denied');
      permission=await Geolocator.requestPermission();

    }
    if(permission==LocationPermission.whileInUse||permission==LocationPermission.always){
      print('Permission always');
      getLocation();
    }
  }
  void getLocation() async{
    Location location=Location();
    await location.getCurrentLocation();
    final String apiKey='870a04c755bc71854ca2b3cfd71acfec';
    String url ="https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey";
    Networking networking=Networking(url: url);
    var datareturned= await networking.getData();
    print(datareturned);
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: datareturned);
    }));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Location Permission Example')),
    body: Center(
    child: SpinKitCubeGrid(
        color:Colors.white,
        size : 50.0,

    )
    )
    );
  }
}
