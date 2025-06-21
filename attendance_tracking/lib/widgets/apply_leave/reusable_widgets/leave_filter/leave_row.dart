import 'package:flutter/material.dart';
import 'package:attendance_tracking/controllers/apply_leave/leave_type_controller.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:get/get.dart';
class LeaveRow extends StatefulWidget {

  LeaveRow({required this.text,required this.value});
  final String text;
  final String value;
  @override
  State<LeaveRow> createState() => _LeaveRowState();
}

class _LeaveRowState extends State<LeaveRow> {
  @override
  LeaveTypeController leaveTypeController=Get.find();
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(leaveTypeController.leaveTypeValue.value==widget.value){
          leaveTypeController.updateLeaveType("null");
        }
        else{
          leaveTypeController.leaveTypeValue.value=widget.value;
        }
      },
      child: Row(
        children: [
          Obx(()=>Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: leaveTypeController.leaveTypeValue.value==widget.value?kBluePasswordVerification:Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  border: Border.all(
                      color: leaveTypeController.leaveTypeValue.value==widget.value?kBluePasswordVerification:Color(0xFFEEEFF0),
                      width: 2
                  )
              ),
              child: Icon(Icons.check,color: Colors.white,size: 22)
          ),
          ),
          SizedBox(width: 10),
          Text(widget.text,style: kLeaveDetailsHeader.copyWith(color: Colors.black,fontSize: 15),),
        ],
      ),
    );
  }
}