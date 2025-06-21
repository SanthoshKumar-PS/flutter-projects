import 'package:flutter/material.dart';

import 'CheckOut/CheckoutData.dart';
class Secondpageitems extends StatefulWidget {

  @override
  State<Secondpageitems> createState() => _SecondpageitemsState();
}

class _SecondpageitemsState extends State<Secondpageitems> {


  Widget build(BuildContext context) {
    final Map<String, dynamic> passedData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
     return SafeArea(
       child: Scaffold(
         body: ListView.builder(
            scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount:Checkoutdata.checkoutitemslist.length,
           //see here to know
              itemBuilder: (context,index){
              return Container(
                color: Colors.black,
                child: TextButton(onPressed: (){

                },
                    child: Text('click me'))
                //Image(image: AssetImage(passedData['imageName'])),
              );
       }
       ),
       ),
     );
  }
}

