import 'package:flutter/material.dart';
import 'package:y_water_monitor/main.dart';

class Result extends StatelessWidget {
  @override
  Result({this.overview='',this.quantity='',this.message=''});
  final String overview;
  final String quantity;
  final String message;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydration result'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Column(
          children: [
            SizedBox(height: 70),
            Container(
              margin:EdgeInsets.only(left:10) ,
              alignment: Alignment.bottomLeft,
              child: Text('Your result',
                style: kBigTextStyle,
              ),
            ),
            SizedBox(height: 100),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(overview,
                    style: TextStyle(
                      color: Colors.green,
                        fontSize: 30
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(quantity,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('L',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w900),)
                    ],
                  ),
                  Text(message,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pinkAccent
                  ),)
                ],
              ),
            ),
            SizedBox(height: 100),
            Builder(
                builder: (context) => GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  // onTap:(){
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context)=>Result()));
                  // },
                  child: Container(
                    color: kConstColor,
                    padding: EdgeInsets.only(bottom: 15),
                    width: double.infinity,
                    height: 60,
                    child: Center(
                      child: Text(
                        'RE-CALCULATE',
                        style: kTextStyle,
                      ),
                    ),
                  ),
                )),
          ],
        )
      ),
    );
  }
}
