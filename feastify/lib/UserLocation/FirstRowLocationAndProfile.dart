import 'package:flutter/material.dart';
import 'Userlocation.dart';
import 'SelectLocation.dart';

// This Class has LocationIcon, Area Join Prime and Profle Image

class FirstRowLocationAndProfile extends StatefulWidget {
  const FirstRowLocationAndProfile({
    super.key,
  });
  @override
  State<FirstRowLocationAndProfile> createState() => _FirstRowLocationAndProfileState();
}

class _FirstRowLocationAndProfileState extends State<FirstRowLocationAndProfile> {
  @override
  @override
  //below four lines are the only code for location of user && also at column that was called
  String? userCityName;
  String cityName="Loading..⏳";
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCurrentLocation();
  }
  Future fetchCurrentLocation() async{
    Userlocation userlocation=Userlocation();
    await userlocation.getLocation();
    // cityName=userlocation.cityName;
    setState(() {
      cityName=userlocation.cityName;

    });
    //print("Printing cityName $cityName");
  }
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async{
            userCityName=await Navigator.push(context,MaterialPageRoute(builder: (context){
              return Selectlocation();
            }));
            setState(() {
              cityName=userCityName!;
              if(cityName.isEmpty){}
              else{
                cityName=cityName[0].toUpperCase() + cityName.substring(1);
              }
            });
          },
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.location_on,size: 30,color: Colors.white,),
              Text("$cityName",style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,decoration: TextDecoration.none)),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              //This column is JOIN PRIME
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('Join',style: TextStyle(fontSize:15,color: Color(0xFFE8B903),fontWeight: FontWeight.w500,decoration: TextDecoration.none),)),

                  Expanded(child: Text('Prime',style: TextStyle(fontSize:15,color: Color(0xFFE8B903),fontWeight: FontWeight.bold,decoration: TextDecoration.none),))
                ],
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(backgroundColor:Colors.white70,
                child:Text('S')),
            SizedBox(width: 10,)
          ],)
      ],
    );
  }
}







