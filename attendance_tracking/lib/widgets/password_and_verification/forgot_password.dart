import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:attendance_tracking/controllers/emailphonecontroller.dart';
import 'reusable_widgets/email_phone_widget.dart';
import 'new_password.dart';
class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  EmailPhoneController emailphoneController=Get.find();

  String selectedValue="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 60,
          leading:Icon(Icons.navigate_before_rounded, size: 40, color: Colors.black54,grade:200),
          backgroundColor: kBackgroundColor
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox(height: 28,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forgot password🤔',style:kPasswordVerification),
                  SizedBox(height: 10),
                  Text(
                      'Select which contact details should we use to reset your password.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kVeryLightText
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  //height: (MediaQuery.of(context).size.height)*0.40,
                  //height: 350,
                  width: double.infinity,
                  child: Image(image: AssetImage('images/PasswordValidation/forgotpassword.png')),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  EmailPhoneWidget(iconName: Iconsax.sms, heading: "Email", content:"michael.mitc@example.com", value: "email"),
                  SizedBox(height: 15),
                  EmailPhoneWidget(iconName: Iconsax.call, heading: "Phone Number", content:"(217) 555-0113", value: "phone"),
                  //SizedBox(height: 10)
      
                ],
              ),

              SizedBox(height: 20),


              GestureDetector(
                onTap: (){
                  Get.toNamed('/verificationcode');
                },
                child: Container(
                  height: 57,
                  decoration: BoxDecoration(
                      color: kBluePasswordVerification,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Center(
                    child: Text('Continue',style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'PoppinsLight',
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
      
      
      
            ],
          ),
        ),
      ),
    );
  }
}
