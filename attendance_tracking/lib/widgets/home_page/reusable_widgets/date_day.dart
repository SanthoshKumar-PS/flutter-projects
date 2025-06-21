import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:get/get.dart';
import 'package:attendance_tracking/controllers/home_page/datecontroller.dart';

class DateDay extends StatefulWidget {
  DateDay({required this.date,required this.day});
  final String date;
  final String day;

  @override
  State<DateDay> createState() => _DateDayState();
}

class _DateDayState extends State<DateDay> {
  DateController dateController=Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(dateController.selectedDate.value==widget.date){
            dateController.updateDate("");
          }
          else {
            dateController.selectedDate.value=widget.date;
          }
        });
      },
      child: Obx(()=>Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: dateController.selectedDate.value==widget.date?kBluePasswordVerification:null,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 1,color: kLightBorderColor)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.date,style: kEmailPhoneText.copyWith(fontSize: 17,color: dateController.selectedDate.value==widget.date?kBackgroundColor:null)),
              Text(widget.day,style: kLeaveDetailsHeader.copyWith(color: dateController.selectedDate.value==widget.date?kBackgroundColor:null))
            ],
          ),
        ),
      ),
    );
  }
}
