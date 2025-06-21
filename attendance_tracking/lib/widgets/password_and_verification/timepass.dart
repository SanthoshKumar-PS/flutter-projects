import 'package:attendance_tracking/widgets/password_and_verification/congratulations.dart';
import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'reusable_widgets/bottom_continue_button.dart';

class Timepass extends StatelessWidget {
  const Timepass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(height:250,child: Image(image: AssetImage('images/PasswordValidation/thankyou.png'))),
      Column(
        children: [
          Text('Congratulations🎉',
              style: kLeaveDetailsFooter.copyWith(
                  color: kBluePasswordVerification,
                  fontSize: 25
              )),
          Text('Your account is ready to use',
              style: kLeaveDetailsHeader.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
      BottomContinueButton(text: 'Back to Home')
    ],
    ),
      ),
      )
    );
  }
}
