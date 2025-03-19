import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // Function to check and request location permission
  Future<void> getLocation() async{
    LocationPermission permission=await Geolocator.checkPermission();

    if(permission==LocationPermission.denied){
      permission= await Geolocator.requestPermission();
    }
    if(permission==LocationPermission.deniedForever){
      print("Location Permission Denied Forever");
      return;
    }
    if(permission==LocationPermission.whileInUse||permission==LocationPermission.always){
      final LocationSettings locationsettings=LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 100
      );
      Position position=await Geolocator.getCurrentPosition(locationSettings: locationsettings);
      print('Latitude: ${position.latitude}');
      print('Altidtude: ${position.altitude}');
      print('accuracr: ${position.altitudeAccuracy}');
    }
  }
  // Future<void> getLocation() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //
  //   // If permission is denied, request permission
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }
  //
  //   // If permission is denied forever, show a message to the user`
  //   if (permission == LocationPermission.deniedForever) {
  //     // Handle the case when the permission is denied forever
  //     print('Location permission denied forever.');
  //     return;
  //   }
  //
  //   // If permission is granted, proceed to get the current location
  //   if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
  //     final LocationSettings locationSettings = LocationSettings(
  //       accuracy: LocationAccuracy.bestForNavigation,
  //       distanceFilter: 100,
  //     );
  //     Position position = await Geolocator.getCurrentPosition(
  //         locationSettings: locationSettings);
  //
  //     print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  //
  //   }
  //   else {
  //     print('Permission denied');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Permission Example')),
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocation(); // Call the function when the button is pressed
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}