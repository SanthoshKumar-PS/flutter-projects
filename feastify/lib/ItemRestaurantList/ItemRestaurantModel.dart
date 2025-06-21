import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feastify/RestaurantFiles/RestaurantModel.dart';
import 'package:feastify/main.dart';
import 'package:feastify/RestaurantFiles/RestaurantData.dart';





class Itemrestaurantmodel extends StatelessWidget{
  static List<Restaurant> itemcheckoutrestaurant=[];

  Widget build(BuildContext context){
    if(itemcheckoutrestaurant.isEmpty){
      print('hello empty');
      return Container(
        color: kbackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.error,color: Colors.white,size: 40,),
            Text('Sorry!!!',style: TextStyle(fontSize: 30,decoration: TextDecoration.none),),
            Text('No result found,\nsearch for others',style: TextStyle(fontSize: 20,color: Colors.pink[100],decoration: TextDecoration.none),),
          ],
        ),
      );
    }
    else{
      final Map<String,String> passedItemName = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      int findIndex=0;
      return SafeArea(
        child: Container(
            color: kbackgroundColor,
            child: ListView.builder(
                itemCount:itemcheckoutrestaurant.length ,
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context,index){
                 for(int coun=0;coun<itemcheckoutrestaurant[index].menu.length;coun++){
                   if(itemcheckoutrestaurant[index].menu[coun].itemName==passedItemName['name']){
                     return GestureDetector(
                       onTap: (){
                         findIndex=RestaurantData.restaurant.indexOf(itemcheckoutrestaurant[index]);
                         Navigator.pushNamed(context, '/restaurantpage',arguments: findIndex);
                       },
                       child: Container(
                         margin: EdgeInsets.fromLTRB(20,10,20,10),
                           // padding: EdgeInsets.fromLTRB(10,10,10,10),
                           // height: 340,

                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: kforegroundColor,
                           ),
                           child:Column(
                             children: [
                               Container(
                                 height: 250,
                                 width: double.infinity,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                                 ),
                                   child: Image(image: AssetImage(itemcheckoutrestaurant[index].menu[coun].imageName),
                                     fit: BoxFit.cover,
                                     width: double.infinity,
                                   ),
                               ),
                               Container(
                                 padding: EdgeInsets.fromLTRB(10,10,10,10),
                                 child: Column(
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text(itemcheckoutrestaurant[index].resName,style: TextStyle(fontFamily: 'KumarOne',fontSize: 25,fontWeight: FontWeight.bold,decoration: TextDecoration.none,
                                               color: Colors.white,
                                               shadows: [
                                                 Shadow(
                                                   color: Colors.black.withOpacity(0.5), // Shadow color
                                                   offset: Offset(1,1), // X and Y offset of shadow
                                                   blurRadius: 5, // How blurry the shadow should be
                                                 ),
                                               ],
                                             ),),
                                             SizedBox(height: 5),
                                             Text(itemcheckoutrestaurant[index].menu[coun].itemName, style: TextStyle(color:Colors.white,fontSize: 13,decoration: TextDecoration.none)),
                                             SizedBox(height: 5),

                                           ],
                                         ),
                                         Row(
                                           children: [
                                             Icon(Icons.add_circle,color:itemcheckoutrestaurant[index].menu[coun].vegnon? Colors.green:Colors.red),
                                             Text(itemcheckoutrestaurant[index].menu[coun].vegnon? 'Veg':'NonVeg',style: TextStyle(color:Colors.white,fontSize: 13,decoration: TextDecoration.none))
                                           ],
                                         ),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Text('Price',style: TextStyle(color:Colors.white,fontFamily: 'KumarOne',fontSize: 20,decoration: TextDecoration.none)),
                                             SizedBox(height: 5),
                                             Text(itemcheckoutrestaurant[index].menu[coun].price.toString(),style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15,decoration: TextDecoration.none)),
                                             SizedBox(height: 5),
                                           ],
                                         )
                                       ],
                                     ),
                                     SizedBox(height: 5),
                                     Divider(
                                       height: 1,
                                       color: Colors.white24,
                                     ),
                                     SizedBox(height: 5),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text(itemcheckoutrestaurant[index].resQuotes,style: TextStyle(fontFamily:'KumarOne',fontSize: 15,fontWeight: FontWeight.bold,decoration: TextDecoration.none)),
                                       ],
                                     )
                                   ],
                                 ),
                               )
                             ],
                           )

                       ),
                     );
                   }

                 }
                }
            )
        ),
      );
    }
  }

}