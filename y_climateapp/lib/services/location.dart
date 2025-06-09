import 'package:geolocator/geolocator.dart';
class Location
{
   double? latitude;
   double? altitude;
   double? longitude;
   double? city;
   double? description;

  Future<void> getCurrentLocation() async{
    final LocationSettings locationSettings=LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 100
    );

    try{
      Position position=await Geolocator.getCurrentPosition(locationSettings:locationSettings);
      latitude=position.latitude;
      altitude=position.altitude;
      longitude=position.longitude;
    }
    catch(e){
      print('Exception: $e');
    }

  }
}