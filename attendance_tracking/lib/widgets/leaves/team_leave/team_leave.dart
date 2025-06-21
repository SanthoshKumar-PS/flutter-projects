import 'package:flutter/material.dart';
import 'team_leave_accept_reject.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:iconsax/iconsax.dart';

class TeamLeave extends StatelessWidget {
  const TeamLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        //height: 100,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                width: 45,
                height: 45,
                child: CircleAvatar(
                  radius: 22.5,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMGltYWdlfGVufDB8fDB8fHww",
                  ),
                  //Text('A'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jane Cooper',
                    style: kLeaveDetailsHeader.copyWith(fontSize: 13),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Apr 15, 2023 - Apr 12, 2023',
                    style: kLeaveDetailsFooter,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TeamLeaveAcceptReject(
                    text: 'Reject',
                    iconName: Iconsax.close_circle,
                    color: Color(0xFFFF756E),
                  ),
                  SizedBox(width: 15),
                  TeamLeaveAcceptReject(
                    text: 'Accept',
                    iconName: Iconsax.tick_circle,
                    color: Color(0xFF00C1B7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}