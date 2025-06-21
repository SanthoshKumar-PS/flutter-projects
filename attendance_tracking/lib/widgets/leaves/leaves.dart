import 'package:attendance_tracking/widgets/apply_leave/leave_filter.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:iconsax/iconsax.dart';
import 'reusable_widgets/upcoming_past_team_leave.dart';
import 'reusable_widgets/leave_container.dart';
import 'reusable_widgets/leave_list.dart';
// import 'reusable_widgets/leave_details.dart';
import 'team_leave/team_leave.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
class Leaves extends StatefulWidget {
  const Leaves({super.key});

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                //color: Color(0xFFFFFFFF),
                gradient: LinearGradient(
                  begin: Alignment.center, //  Gradient starts from top
                  end: Alignment.bottomCenter, //  Ends at bottom
                  colors: [
                    Color(0xFFFFFFFF), // White at the top
                    Color(0xFFF5F5F5), // Light grey at the bottom
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Leaves',
                          style: kTextStyle.copyWith(fontSize: 19),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed:(){
                                  Get.toNamed('/applyleave');
                                },
                                  icon: Icon(Iconsax.add_square, size: 30)
                              ),
                              SizedBox(width: 13),
                              IconButton(
                                  onPressed: (){
                                    LeaveFilter.bottomSheetSuccess(context);
                                  },
                                  icon: Icon(Iconsax.filter_square, size: 30)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            LeaveContainter(
                              text: 'Leave\nBalance',
                              borderColor: Color(0xFF008AFF),
                              count: 20,
                              bgColor: Color(0xFFF4F9FF),
                            ),
                            SizedBox(width: 12),
                            LeaveContainter(
                              text: 'Leave\nApproved',
                              borderColor: Color(0xFFA4D925),
                              count: 2,
                              bgColor: Color(0xFFF9FDF4),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            LeaveContainter(
                              text: 'Leave\nPending',
                              borderColor: Color(0xFF00C1B7),
                              count: 4,
                              bgColor: Color(0xFFF4F9FF),
                            ),
                            SizedBox(width: 12),
                            LeaveContainter(
                              text: 'Leave\nCancelled',
                              borderColor: Color(0xFFFF7770),
                              count: 10,
                              bgColor: Color(0xFFFFF9F8),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Upcomingpastteamleave(),
                  LeaveList(),
                  LeaveList(),
                  TeamLeave(),
                  SizedBox(height: 120),

                  //  TeamLeave(),
                ],
              ),
            ),
          ),
        ),
      );
  }
}




