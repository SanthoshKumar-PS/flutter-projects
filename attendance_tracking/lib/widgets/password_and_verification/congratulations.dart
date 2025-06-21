import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'reusable_widgets/bottom_continue_button.dart';
import 'package:get/get.dart';

class Congratulations {
  static void showDialogBox(BuildContext context){
    showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5), // Dim background
        builder: (context){
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  // margin: EdgeInsets.all(16),
                  //padding: EdgeInsets.all(16),
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          height:250,
                          child: Image(image: AssetImage('images/PasswordValidation/thankyou.png'),
                          ),
                      ),
                      Column(
                        children: [
                          Text('Congratulations🎉',
                              style: kLeaveDetailsFooter.copyWith(
                                  color: kBluePasswordVerification,
                                  fontSize: 25
                              )),
                          SizedBox(height: 5),
                          Text('Your account is ready to use',
                              style: kLeaveDetailsHeader.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed('loginpage');
                          },
                            child: BottomContinueButton(text: 'Back to Home')
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          );
        });
  }
}
