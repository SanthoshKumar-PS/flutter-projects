import 'package:attendance_tracking/constants.dart';
import 'package:attendance_tracking/widgets/apply_leave/reusable_widgets/bottom_continue_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LeaveAppliedSuccessfully  {
  static void bottomSheetSuccess(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context)=>Container(
          decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(5))
          ),
          height: 350,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 200),
                child: Divider(
                  color: Color(0xFFE7E7E8),
                  thickness: 2,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height:100,
                        child: Lottie.asset('assets/blueSuccess.json',repeat: false),
                      ),
                      Text('Leave Applied\n Successfully',style: kTextStyle.copyWith(fontSize: 20)),
                      Text('Your Leave has been\napplied successfully',style: kEmailText.copyWith(fontSize: 15)),
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: BottomContinueButton(text: 'Done')
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

        ));
  }
}
