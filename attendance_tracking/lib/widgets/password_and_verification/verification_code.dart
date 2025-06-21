import 'dart:async';
import 'package:attendance_tracking/widgets/password_and_verification/congratulations.dart';
import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:pinput/pinput.dart';
import 'reusable_widgets/bottom_continue_button.dart';
import 'package:get/get.dart';
class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  @override
  int secondsTimer=30;
  void initState() {
    // TODO: implement initState
    super.initState();
    onTimer();
  }
  void onTimer(){
    Timer.periodic(Duration(seconds: 1), (timer){
      if(secondsTimer>0){
        setState(() {
          secondsTimer--;
        });
      }
      else{
        timer.cancel();
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          leading: Icon(Icons.navigate_before_rounded, size: 40, color: Colors.black54,grade:200),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics:AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 28,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter Verification Code',style:kPasswordVerification),
                          SizedBox(height: 10),
                          Text(
                              'We have sent the code verification to your mobile number',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kVeryLightText
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Pinput(
                          length: 4,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          defaultPinTheme: PinTheme(
                            margin: EdgeInsets.all(5),
                            height: 78,
                            width: 74,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                color: Color(0xFFF0F1F2),
                                width: 2
                              )
                            ),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontFamily: 'PoppinsLight',
                              fontWeight: FontWeight.bold
                            )
                          ),
                          focusedPinTheme: PinTheme(
                            margin: EdgeInsets.all(5),
                            height: 84,
                            width: 84,
                            textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 2),
                            ),
                          ),
                
                          onCompleted: (pin){
                            print(pin);
                            FocusScope.of(context).unfocus();
                          },
                          onChanged: (pin){
                            print(pin);
                
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('00:${secondsTimer>9?secondsTimer:'0$secondsTimer'}',style: kVeryLightText.copyWith(color: Colors.black,fontSize: 15.5),),
                          Text('  Resend it',style: kVeryLightText.copyWith(color: kBluePasswordVerification,fontSize: 16),)
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: Image(image: AssetImage('images/PasswordValidation/authentication.png')),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Congratulations.showDialogBox(context);
                  },
                  child: BottomContinueButton(text: 'Continue')
              ),

            ],
          ),
        ),
      ),
    );
  }
}


