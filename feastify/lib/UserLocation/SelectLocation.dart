import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feastify/main.dart';
import 'Userlocation.dart';

class Selectlocation extends StatefulWidget {
  Selectlocation({super.key});

  @override
  State<Selectlocation> createState() => _SelectlocationState();
}

class _SelectlocationState extends State<Selectlocation> {
  String? userCityName;
  bool? cityAvailable;
  TextEditingController textEditingController=TextEditingController();


  Widget getResults(availableCity){
    if(availableCity==false){
      return locationAvailableContainer("City Not Available,\nEnter any valid city");
    }
    else if(availableCity==true){
      return locationAvailableContainer("City Available");
    }
    else{
      return Container();
    }
  }

  Container locationAvailableContainer(text) {
    return Container(
        color: Colors.transparent,
        child:Text(text,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w300,fontFamily: 'Fuemen'),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kbackgroundColor,
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: textEditingController,
                  maxLength: 20,
                  style: TextStyle(fontSize: 18, color: Colors.white,decoration: TextDecoration.none),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city,color: Colors.white,size: 30),
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Enter Your City Name',
                      labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      //hintText: 'Chennai',
                      suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.white),onPressed: () {
                        textEditingController.clear();
                      })
                  ),
                  onChanged: (text){
                    userCityName=text;
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: TextButton(
                    onPressed: () async{
                      FocusScope.of(context).unfocus();
                      Userlocation userlocation=Userlocation();
                      bool result=await userlocation.getUserCity(userCityName);

                      setState(() {
                        cityAvailable=result;
                      });
                      if(cityAvailable==true){
                        Navigator.pop(context,userCityName);
                      }
                    },
                    child: Text('Submit',
                        style:TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Fuemen')
                    )
                ),
              ),
              SizedBox(height: 40),
              getResults(cityAvailable),

            ],
          ),
        ),
      ),
    );
  }
}
