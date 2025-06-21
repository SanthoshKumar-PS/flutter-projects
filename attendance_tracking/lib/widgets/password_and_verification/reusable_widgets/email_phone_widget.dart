import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_tracking/controllers/emailphonecontroller.dart';
import 'package:attendance_tracking/constants.dart';

class EmailPhoneWidget extends StatelessWidget {
  EmailPhoneWidget({required this.iconName,required this.heading,required this.content,required this.value});
  final IconData iconName;
  final String heading;
  final String content;
  final String value;   //value=phone or email
  EmailPhoneController emailphoneController=Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          emailphoneController.updateValue(value);
        },
        child: Obx(()=>Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFFFFFFFF),
              border: Border.all(
                  color: emailphoneController.emailPhone.value==value?kBluePasswordVerification:Color(0xFFEEEFF0),
                  width: 1.5
              )

          ),
          padding: EdgeInsets.fromLTRB(25,16,25,16),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: emailphoneController.emailPhone.value==value?kBluePasswordVerification:Color(0xFFF7F7F8)
                      ),
                      child: Icon(iconName,color: emailphoneController.emailPhone.value==value?Colors.white:Colors.black)
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(heading,style: kEmailPhoneText),
                      SizedBox(height: 2),
                      Text(content,style: kEmailText)
                    ],
                  ),

                ],
              ),
              Container(
                height: 25,
                width: 25,
                decoration:BoxDecoration(
                  color: Colors.white38,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: emailphoneController.emailPhone.value==value?kBluePasswordVerification:Color(0xFFE1E2E3),
                    // color: selectedValue=="email"?Colors.blue:Color(0xFFE1E2E3),
                    width: 2,
                  ),
                ),

                //selectedValue=="email"
                child: emailphoneController.emailPhone.value==value?
                Padding(
                  padding: EdgeInsets.all(1.5),
                  child: CircleAvatar(backgroundColor: kBluePasswordVerification,),
                )
                    :
                CircleAvatar(backgroundColor: Colors.transparent,),

              )
            ],
          ),
        ))
    );
  }
}



