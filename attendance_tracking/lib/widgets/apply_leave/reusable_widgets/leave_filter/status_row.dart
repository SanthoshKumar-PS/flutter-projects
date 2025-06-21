import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:attendance_tracking/controllers/apply_leave/status_controller.dart';
class StatusRow extends StatefulWidget {
  StatusRow({required this.text,required this.value});
  final String text;
  final String value;
  @override
  State<StatusRow> createState() => _StatusRowState();
}

class _StatusRowState extends State<StatusRow> {
  String? statusSelected;
  StatusController statusController=Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(statusController.statusValue.value==widget.value){
          statusController.updateStatus("null");
        }
        else{
          statusController.statusValue.value=widget.value;
        }
      },
      child: Row(
        children: [
          Obx(()=>Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: statusController.statusValue.value==widget.value?kBluePasswordVerification:Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  border: Border.all(
                      color: statusController.statusValue.value==widget.value?kBluePasswordVerification:Color(0xFFEEEFF0),
                      width: 2
                  )
              ),
              child: Icon(Icons.check,color: Colors.white,size: 22)
          ),
          ),
          SizedBox(width: 10),
          Text(widget.text,style: kLeaveDetailsHeader.copyWith(color: Colors.black,fontSize: 15),),//kEmailText
        ],
      ),
    );
  }
}