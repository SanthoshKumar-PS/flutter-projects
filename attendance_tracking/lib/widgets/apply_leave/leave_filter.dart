import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:attendance_tracking/constants.dart';
import 'reusable_widgets/leave_filter/status_row.dart';
import 'reusable_widgets/leave_filter/leave_row.dart';
import 'reusable_widgets/leave_filter/bottom_buttom_apply_reset.dart';
// import 'package:lottie/lottie.dart';
// import 'reusable_widgets/bottom_continue_button.dart';
// import 'package:diggibyte/controllers/apply_leave/status_controller.dart';
// import 'package:diggibyte/controllers/apply_leave/leave_type_controller.dart';
// import 'package:get/get.dart';

class LeaveFilter {
  static void bottomSheetSuccess(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: Duration(milliseconds: 400),
      ),
      builder: (context) {
        return DraggableSheet();
      },
    );
  }
}

class DraggableSheet extends StatefulWidget {
  @override
  _DraggableSheetState createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutQuad,
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.reverse();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOutQuad,
      child: DraggableScrollableSheet(
        initialChildSize: 0.72,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context,scrollController)=>ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
          child: Material(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                // borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
              ),
              // height: 350,
              width: double.infinity,
              child: Wrap(
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 140),
                          child: Divider(
                            color: Color(0xFFE7E7E8),
                            thickness: 2,),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Filter',style: kTextStyle),
                            IconButton(
                                onPressed: (){Navigator.pop(context);},
                                icon: Icon(Iconsax.close_circle))
                          ],
                        ),
                        SizedBox(height: 20),
                        Text('Status',style: kTextStyle),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            StatusRow(text: "Approved",value: "approved",),
                            SizedBox(height: 10),
                            StatusRow(text: "Unapproved",value: "unapproved",),
                            SizedBox(height: 10),
                            StatusRow(text: "Pending",value: "pending",),

                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: Divider(
                            color: Color(0xFFE7E7E8),
                            thickness: 2,),
                        ),
                        SizedBox(height: 10),


                        Text('Leave Type',style: kTextStyle),
                        SizedBox(height: 10),


                        Column(
                          children: [
                            LeaveRow(text: "Sick Leave", value:"sick"),
                            SizedBox(height: 10),
                            LeaveRow(text: "Planned Leave", value: "planned"),
                            SizedBox(height: 10),
                            LeaveRow(text: "Holiday", value: "holiday")
                          ],
                        ),
                        SizedBox(height: 10),


                        Text('Team Member',style: kTextStyle),
                        SizedBox(height: 15),

                        DropdownButtonFormField<String>(
                          value: "Santhosh",
                          items: ["Santhosh","Ukesh","Harish","Krishna","Ramesh","Johnson","Smith"].map(
                                  (name)=>DropdownMenuItem(
                                  value:name,child: Text(name,style: kEmailText.copyWith(color: Colors.black,fontSize: 15),)
                              )).toList(),
                          onChanged: (value){
                            print(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                            label: Text("Select Team Member"),
                            labelStyle: kLeaveDetailsFooter.copyWith(fontSize: 16,color: kBluePasswordVerification),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: kBluePasswordVerification,
                                  width: 2
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: kBluePasswordVerification,
                                  width: 2
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: kBluePasswordVerification,
                                  width: 2
                              ),
                            ),
                          ),


                        ),

                        SizedBox(height: 20),
                        Row(
                          children: [
                            BottomButtonApplyReset(text:"Reset",bgcolor: Color(0xFFFBFBFB),textcolor: Colors.black),
                            SizedBox(width: 15),
                            BottomButtonApplyReset(text:"Apply",bgcolor: kBluePasswordVerification,textcolor: Colors.white)
                          ],
                        ),
                        SizedBox(height: 15),

                      ],
                    ),
                  ]
              ),

            ),
          ),
        ),
      ),
    );
  }
}







