import 'package:flutter/material.dart';
import 'leave_details.dart';
import 'package:attendance_tracking/constants.dart';
class LeaveList extends StatelessWidget {
  const LeaveList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        //height: 100,
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text('Date',
                          style: kLeaveDetailsHeader,
                        ),
                      ),
                      Text('Apr 15,2023 - Apr 18,2023',style: kLeaveDetailsFooter)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFF3FCFB),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text('Approved',style: TextStyle(color: Color(0xFF53D9D2),fontFamily: 'Poppins',fontSize: 10),),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Divider(
                thickness: 1,
                color: Color(0xFFF8F8F8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeaveDetails(description: 'Apply Days',value: '2 Days',),
                  LeaveDetails(description: 'Leave Balance', value: '19'),
                  LeaveDetails(description: 'Approved By', value: 'Martin Deo'),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}