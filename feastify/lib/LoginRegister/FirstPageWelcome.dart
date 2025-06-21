import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelocomePage extends StatefulWidget {
  const WelocomePage({super.key});

  @override
  State<WelocomePage> createState() => _WelocomePageState();
}

class _WelocomePageState extends State<WelocomePage> {
  TextStyle kwelcomeTextStyle=TextStyle(
    fontFamily: 'Poppins',  // Use Google Fonts if needed
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1E3A8A), // Dark Blue
    shadows: [
      Shadow(
        blurRadius: 5.0,
        color: Colors.black.withOpacity(0.2),
        offset: Offset(2, 2),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Column(children: [
                  Image(image: AssetImage('images/applogos/zippybytelogo.png'),height: 200,width: 200),
                  Text('ZippyBites',
                      style: kwelcomeTextStyle.copyWith(color: Color(0xFFFF3D33),fontSize: 25)
                  ),
                ],),
                SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: DefaultTextStyle(
                    style: kwelcomeTextStyle,
                    child: Center(
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText('Welcome,\nHappy Fooding😊', textAlign: TextAlign.center,),
                        ],
                        onTap: () {
                          //print("Tap Event");
                        },
                      ),
                    ),
                  ),
                ),
                // Column(children: [
                //   Text('Welcome',style:kwelcomeTextStyle),
                //   Text('Happy Fooding',style:kwelcomeTextStyle),
                // ],),

                SizedBox(height: 30),
                Column(children: [
                  WelcomeButtons(kwelcomeTextStyle: kwelcomeTextStyle,pageName: '/registerpage',text: 'Register',),
                  SizedBox(height: 30),
                  WelcomeButtons(kwelcomeTextStyle: kwelcomeTextStyle,pageName: '/loginpage',text: 'Login',)
                ],),
                SizedBox(height: 80),

              ],
            ),
          )
      ),
    );
  }
}

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({
    super.key,
    required this.kwelcomeTextStyle, required this.pageName,required this.text
  });
  final String text;
  final String pageName;
  final TextStyle kwelcomeTextStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, pageName);
        },
        child: Container(
            height:50,width:130,
            child: Center(child: Text(text,style:kwelcomeTextStyle.copyWith(fontSize:25 ))))
    );
  }
}
