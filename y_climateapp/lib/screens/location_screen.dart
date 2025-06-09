import 'package:flutter/material.dart';
import 'package:y_climateapp/utilities/constants.dart';
import 'package:y_climateapp/services/weather.dart';
import 'loading_screen.dart';
import 'city_screen.dart';
import 'package:y_climateapp/services/networking.dart';
import 'package:http/http.dart' as http;

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature;
  int? condition;
  String? city;
  String? iconName;
  String? message;
  WeatherModel weatherModel=WeatherModel();
  String? userCityname;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }
  updateUI(locationWeather){
    setState(() {
      temperature=(locationWeather['main']['temp']-273.15).toInt();
      print(temperature);
      city=locationWeather['name'];
      print(city);
      condition=locationWeather['weather'][0]['id'];
      print(condition);

      iconName=weatherModel.getWeatherIcon(condition);
      message=weatherModel.getMessage(temperature);
    });

    // print(temperature);
    // print(city);
    // print(condition);
  }
  void getCityData(cityName) async{
    String apiKey='870a04c755bc71854ca2b3cfd71acfec';
    String url2 ='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    http.Response response=await http.get(Uri.parse(url2));
    if(response.statusCode==200){
      print(response.body);
      var dataRecieved=await Networking(url: url2).getData();
      updateUI(dataRecieved);
    }
    else{
      print("Error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                  onPressed: ()  {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoadingScreen()),
                    );
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      userCityname=await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                      getCityData(userCityname);
                      // int? temperature;
                      // int? condition;
                      // String? city;
                      // String? iconName;
                      // String? message;
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temperature.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      iconName!,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}