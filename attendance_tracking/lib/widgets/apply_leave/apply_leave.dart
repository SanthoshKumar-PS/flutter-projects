import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:intl/intl.dart';
import 'reusable_widgets/bottom_continue_button.dart';
import 'leave_applied_successfully.dart';
import 'leave_filter.dart';
import 'package:attendance_tracking/controllers/apply_leave/status_controller.dart';
import 'package:attendance_tracking/controllers/apply_leave/leave_type_controller.dart';
import 'package:get/get.dart';

class ApplyLeave extends StatefulWidget {
   const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  StatusController statusController=Get.find();
  LeaveTypeController leaveTypeController=Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController titleController=TextEditingController();
  final TextEditingController contactController=TextEditingController();
   String leaveTypeValue="Medical Leave";
   final TextEditingController startDateController=TextEditingController();
  final TextEditingController endDateController=TextEditingController();
  final TextEditingController reasonController=TextEditingController();

  DateTime? startPickedDate;
  DateTime? endPickedDate;

  bool datesCorrect=true;
  int leaveDaysApplied=1;
  void checkDates(DateTime startDate,DateTime endDate){
    if(startDate.isBefore(endDate)){
      setState(() {  datesCorrect=true;  });
      leaveDaysApplied=(startDate.difference(endDate).inDays*(-1))+1;
      print(leaveDaysApplied);
    }
    else if(startDate.isAtSameMomentAs(endDate)){
      setState(() {  datesCorrect=true;  });
      leaveDaysApplied=1;
      print(leaveDaysApplied);
    }
    else{
      setState(() {  datesCorrect=false;  });
    }
  }

  Future<DateTime?> selectDate(BuildContext context) async{
     DateTime? pickedDate =await showDatePicker(
         context: context,
         initialDate: DateTime.now(),
         firstDate: DateTime.now(),
         lastDate: DateTime(2030)
     );
     if(pickedDate!=null){
       print('--------------------------------------------------------------------------------------------------------');
       print('${pickedDate.day}-${pickedDate.month}-${pickedDate.year}');
       // Form.of(context)?.validate();
     }
     return pickedDate;
   }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            toolbarHeight: 60,
            leading:Icon(Icons.navigate_before_rounded, size: 40, color: Colors.black54,grade:200),
            title: Text('Apply Leave',style: kTextStyle),
            centerTitle: true,
            backgroundColor: kBackgroundColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 15),
                          TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration("Title","Sick Leave"),
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "⚠ Enter Valid Title";
                              }
                              if(value.length>20){
                                return "⚠ Title Length extends 20";
                              }
                              return null;
                            }
                          ),
                          SizedBox(height: 15),
                          DropdownButtonFormField(
                              value:leaveTypeValue,
                              decoration: buildInputDecoration("Leave Type","Medical Leave"),
                              items: ["Medical Leave","Sick Leave","Vacation","Family Gatherings"]
                                  .map((options)=>DropdownMenuItem(
                                value: options,
                                  child: Text(options,style:kLeaveDetailsHeader)
                              )).toList(),
                              onChanged: (value){
                              setState(() {
                                leaveTypeValue=value!;
                                print(leaveTypeValue);
                              });
                              }
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: contactController,
                            keyboardType: TextInputType.number,
                            decoration: buildInputDecoration("Contact Number","(630)555-0123"),
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "⚠ Enter Your Contact Number";
                              }
                              if(RegExp(r'[a-zA-Z]').hasMatch(value)){
                                return "⚠ Your contact contains alphabets";
                              }
                              if(value.length<10){
                                return "⚠ Contact length is less than 10";
                              }
                              if(value.length>10){
                                return "⚠ Contact length cannot be greater than 10";
                      
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: startDateController,
                            readOnly: true,
                            decoration: buildInputDecoration(
                                "Start Date",
                                startPickedDate!=null?startPickedDate.toString():"Enter date"
                            ).copyWith(suffixIcon: Icon(Icons.calendar_month)),
                            onTap: () async{
                              DateTime? newDate=await selectDate(context);
                              setState(() {
                                if(newDate!=null){
                                  startPickedDate=newDate;
                                  startDateController.text=DateFormat('MMMM dd, yyyy').format(startPickedDate!);  //"${startPickedDate?.toLocal()}".split(' ')[0];
                                }
                              });
                            },
                            validator: (values){
                              if (startPickedDate == null ) {
                                return "⚠ Please select start date";
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: endDateController,
                            readOnly: true,
                            decoration: buildInputDecoration(
                                "End Date",
                                endPickedDate!=null?endPickedDate.toString():"Enter date"
                            ).copyWith(suffixIcon: Icon(Icons.calendar_month)),
                            onTap: ()async{
                              DateTime? newDate=await selectDate(context);
                              if(newDate!=null){
                                setState(() {
                                  endPickedDate=newDate;
                                  endDateController.text=DateFormat('MMMM dd,yyyy').format(endPickedDate!);
                                });
                              }
                            },
                      
                            validator: (values){
                              if (endPickedDate == null) {
                                return "⚠ Please select end date";
                              }
                              if(startPickedDate!=null && endPickedDate!=null){
                                print("both dates are there");
                                checkDates(startPickedDate!, endPickedDate!);
                                if(datesCorrect==false){
                                  print("Im here at start date is not before");
                                  return "Start date is not before end date";
                                }
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: reasonController,
                            decoration: buildInputDecoration("Reason for Leave", "I need to take a medical leave."),
                            keyboardType: TextInputType.text,
                            maxLines: 4,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "⚠ Enter your reason for leave";
                              }
                              if(value.length>100){
                                return "⚠ Length can't be more than 100";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: (){
                            FocusScope.of(context).unfocus();
                            if(formKey.currentState!.validate()){
                              print("validate perfect");
                              LeaveAppliedSuccessfully.bottomSheetSuccess(context);
                              // formKey=GlobalKey<FormState>();
                              // titleController.clear();
                              // contactController.clear();
                              // startDateController.clear();
                              // endDateController.clear();
                              // reasonController.clear();
                            }
                            else{
                              print('validation failed');
                              LeaveAppliedSuccessfully.bottomSheetSuccess(context);

                              //LeaveFilter.bottomSheetSuccess(context);
                              //LeaveAppliedSuccessfully.bottomSheetSuccess(context);
                            }
                          },
                          child: BottomContinueButton(text: 'Apply Leave')
                      ),
                      SizedBox(height: 100,)
                    ],
                  )


                ],
              ),
            ),
          ),

    ));
  }

  InputDecoration buildInputDecoration(String labelText,String hintText) {
    return InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  labelText:labelText,
                  labelStyle: kLeaveDetailsFooter.copyWith(fontSize: 20,color: kBluePasswordVerification),
                    hintText: hintText,
                    hintStyle: kLeaveDetailsHeader,
                    floatingLabelBehavior: FloatingLabelBehavior.always,//"Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 2), // Green on focus Color(0xFFEEEFF0)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kBluePasswordVerification,width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kBluePasswordVerification, width: 2), // Green on focus
                    ),

                );
  }
}
