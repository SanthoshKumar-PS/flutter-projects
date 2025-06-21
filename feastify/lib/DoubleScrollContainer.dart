import 'package:flutter/material.dart';
import 'package:feastify/main.dart';
import 'RestaurantFiles/RestaurantData.dart';
import 'CheckOut/CheckoutData.dart';
import 'CheckOut/CheckoutModel.dart';
import 'ItemRestaurantList/ItemRestaurantModel.dart';

class DoubleScrollContainer extends StatefulWidget {
  DoubleScrollContainer({required this.imageName,required this.name});
  final String imageName;
  final String name;

  @override
  State<DoubleScrollContainer> createState() => _DoubleScrollContainerState();
}

class _DoubleScrollContainerState extends State<DoubleScrollContainer> {
  String selectedItemInRow="";
  String selectedImageInRow="";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          Itemrestaurantmodel.itemcheckoutrestaurant=[];
          selectedItemInRow=widget.name;
          selectedImageInRow=widget.imageName;
          for(var rest in RestaurantData.restaurant){
            for(var menuItem in rest.menu){
              if(menuItem.itemName==selectedItemInRow)    {
                Itemrestaurantmodel.itemcheckoutrestaurant.add(rest);
              }
            }
          }
        });
        Navigator.pushNamed(context, '/itemrestaurant',arguments: {
          'name':selectedItemInRow,
          'imageName': selectedImageInRow
        });

      },
      child: Container(
        width: 85,
        height: 75,
        decoration: BoxDecoration(
          color: kbackgroundColor,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(widget.imageName),fit: BoxFit.contain
          ),
        ),
      ),
    );
  }
}

