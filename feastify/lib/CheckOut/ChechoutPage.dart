import 'package:flutter/material.dart';
import 'package:feastify/CheckOut/CheckoutModel.dart';
import 'package:feastify/main.dart';
import 'CheckoutData.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Checkoutpage extends StatefulWidget {
  State<Checkoutpage> createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed:(){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 20,))
                        ),
                        SizedBox(width: 10,),
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'KumarOne',
                          ),
                          child: Center(
                            child: AnimatedTextKit(
                              totalRepeatCount: 5,
                              animatedTexts: [
                                TypewriterAnimatedText('CheckOut Page',
                                speed: Duration(milliseconds: 100)),
                                ],
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: Checkoutdata.checkoutitemslist.length,
                        itemBuilder: (context,index){
                        return Container(
                          height: 100,
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,//kforegroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //itemName and quantiy:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(Checkoutdata.checkoutitemslist[index].itemName,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      decoration: TextDecoration.none
                                    ),

                                  ),

                                  Text('Quantity: ${Checkoutdata.checkoutitemslist[index].count.toString()}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    ),
                                  )
                                ],
                              ),
                              //pricexquantity
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Price x Quantity',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    ),
                                  ),
                                  Text('${Checkoutdata.checkoutitemslist[index].count*Checkoutdata.checkoutitemslist[index].price}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Total',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    ),
                                  ),
                                  Text('${Checkoutdata.checkoutitemslist[index].count*Checkoutdata.checkoutitemslist[index].price}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    ),
                                  ),
                                ],
                              ),
                            ],

                          ),
                        );
                        }
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Checkoutdata.checkoutitemslist.clear();
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(15,0,15,10),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                height:70,
                width: double.infinity,
                child: RemoveItemsFromCart(),
              ),
            )
          ],
        ));
  }
  Widget RemoveItemsFromCart(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.navigate_before,color: Colors.red,size: 35,),
            Text('Remove all items',
              style:TextStyle(fontSize: 20,decoration: TextDecoration.none) ,),
            Icon(Icons.navigate_next,color: Colors.red,size: 35,)
          ],
        ),
        Text('Return To Home Page|',
          style:TextStyle(fontSize: 10,decoration: TextDecoration.none) ,),
      ],
    );
  }
}


