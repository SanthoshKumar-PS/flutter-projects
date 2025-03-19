import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:y_water_monitor/Calculator.dart';
import 'ResultPage.dart';
import 'IconColumnClass.dart';
import 'GestureClass.dart';
import 'RawButtonPM.dart';
import 'Calculator.dart';

void main() {
  runApp(MyApp());
}

const kConstColor = Color(0xFF1F1B24);
const deactivateColor =  Color(0xFF121212);
const activateColor =  Color(0xFF1F1B24);
const kDarkColor = Color(0xFF121212);
const kTextStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w800);
const kBigTextStyle=TextStyle(fontSize: 50, fontWeight: FontWeight.w800);
enum Gender { male, female, binary }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Gender selectedGender = Gender.binary;
  Color maleColor = deactivateColor;
  Color femaleColor = deactivateColor;
  int height=100;
  int count=10;
  int quantity=250;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kDarkColor,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: kDarkColor,
          elevation: 15,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hydration'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureContainer(
                          onPressed:(){
                            setState(() {
                              maleColor=activateColor;
                              femaleColor=deactivateColor;
                            });
                          },
                          cardWidget: IconColumn(FontAwesomeIcons.mars, 'MALE'),
                          coloring: maleColor,
                        ),
                      ),
                      Expanded(
                        child: GestureContainer(
                          // onPressed: () {
                          //   changeGender(Gender.female);
                          // },
                          onPressed:(){
                            setState(() {
                              maleColor=deactivateColor;
                              femaleColor=activateColor;
                            });
                          },
                          cardWidget: IconColumn(FontAwesomeIcons.venus, 'FEMALE'),
                          coloring: femaleColor,
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: GestureContainer(
                      onPressed: (){},
                      coloring: kConstColor,
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HEIGHT',style: kTextStyle,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment:MainAxisAlignment.center,
                          children: [Text(height.toString(),style:kBigTextStyle),
                              Text('CM',style: kTextStyle,)],
                          ),
                          SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.red[500],
                                inactiveTrackColor: Colors.white,
                                thumbColor: Colors.pinkAccent,
                                overlayColor: Colors.white70,
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),

                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 50,
                                max: 200,
                                onChanged: (double newValue){
                                  setState(() {
                                    height=newValue.round();
                                  });
                                },
                              )),
                          Text('DRAG THE POINTER',style: kTextStyle,textAlign: TextAlign.center,)
                        ],
                        
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                          child: GestureContainer(
                            onPressed:(){},
                          coloring: kConstColor,
                          cardWidget: Column(
                            children: [
                              Text('NO. OF TIMES',style: kTextStyle),
                              Text(count.toString(),style: kBigTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawButtonPlusMinus(
                                    FontAwesomeIcons.minus,
                                    (){
                                      if(count>0){
                                        setState(() {
                                          count--;
                                        });
                                      }
                                    }
                                  ),
                                  SizedBox(width: 15),
                                  RawButtonPlusMinus(
                                    FontAwesomeIcons.plus,
                                      (){
                                      setState(() {
                                        count++;
                                      });
                                      }
                                  ),
                                ],
                              )
                            ],
                          ),),),
                      Expanded(
                        child: GestureContainer(
                          onPressed:(){},
                          coloring: kConstColor,
                          cardWidget: Column(
                            children: [
                              Text('QUANTITY',style: kTextStyle),
                              Text(quantity.toString(),style: kBigTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawButtonPlusMinus(
                                      FontAwesomeIcons.minus,
                                          (){
                                        if(quantity>0){
                                          setState(() {
                                            quantity-=50;
                                          });
                                        }
                                      }
                                  ),
                                  SizedBox(width: 15),
                                  RawButtonPlusMinus(
                                      FontAwesomeIcons.plus,
                                          (){
                                        setState(() {
                                          quantity+=50;
                                        });
                                      }
                                  )
                                ],
                              )
                            ],
                          ),),),
                    ],
                  )




                ],
              ),
            ),
            Builder(
                builder: (context) => GestureDetector(
              onTap:(){
                Calculator cal=Calculator(height, count, quantity);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>Result(
                    overview: cal.getOverview(),
                    quantity: cal.getOverall(),
                    message: cal.getMessage(),
                  )));
              },
              child: Container(
                color: kConstColor,
                padding: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                height: 60,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: kTextStyle,
                  ),
                ),
              ),
            )),
            
          ],
        ),
      ),
    );
  }
}






