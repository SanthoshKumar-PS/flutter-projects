import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants.dart';
import 'reusable_widgets/leave_details/accept_reject_button.dart';
import 'reusable_widgets/leave_details/leave_title_detail.dart';


class LeaveDetails extends StatelessWidget {
  const LeaveDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          leading: Icon(Icons.navigate_before_rounded,
              size: 40,
              color: Colors.black54,
              grade:200),
          title:Text('Leave Details',style: kTextStyle),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  LeaveTitleDetail(title: 'Title',reason: 'Sick Leave'),
                  SizedBox(height: 10),
                  LeaveTitleDetail(title: 'Leave Type',reason: 'Medical Leave'),
                  SizedBox(height: 10),
                  LeaveTitleDetail(title: 'Date',reason: 'April 15,2023 - April 18,2023'),
                  SizedBox(height: 10),
                  LeaveTitleDetail(title: 'Reason',reason: 'I need to take a medical leave.'),
                  SizedBox(height: 10),
                  LeaveTitleDetail(title: 'Applied on',reason: 'February 20,2023'),
                  SizedBox(height: 10),
                  LeaveTitleDetail(title: 'Contact',reason: '(603)555-0123'),
                  SizedBox(height: 10),
                  LeaveTitleDetail(title: 'Status',reason: 'Pending'),
                  SizedBox(height: 10),
                  LeaveTitleDetail(title: 'Approved By',reason: 'Michael Mitc'),
      
      
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  accept_reject(text: "Reject", iconName: Iconsax.close_circle, coloring: Color(0xFFFF7F74)),
                  SizedBox(width: 10),
                  accept_reject(text: "Accept", iconName: Iconsax.tick_circle, coloring: Color(0xFF30BEB6)),
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}


