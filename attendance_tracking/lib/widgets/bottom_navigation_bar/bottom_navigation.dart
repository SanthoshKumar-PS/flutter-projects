import 'package:attendance_tracking/widgets/Leaves/leaves.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:attendance_tracking/controllers/navigation_controller.dart';
import 'package:get/get.dart';
import 'reusable_widgets/bottom_icon.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  NavigationController navigationController=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(()=>navigationController.currentPage.value),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child:Container(
                  height: 80,
                  color: Color(0xFFFEFEFE),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BottomIcon(iconName: Iconsax.home, index: 0),
                      BottomIcon(iconName:Iconsax.calendar, index: 1),
                      SizedBox(),
                      BottomIcon(iconName:Iconsax.activity , index: 2),
                      BottomIcon(iconName: Iconsax.user, index: 3),
      
                    ],
                  ),
                ),
      
            ),
            Positioned(
              bottom: 45,
                left:  MediaQuery.of(context).size.width/2-32,
                child: CircleAvatar(
                    radius: 32,
                    backgroundColor: kBluePasswordVerification,
                    child: Icon(
                      Iconsax.people,
                      color: Colors.white,
                      size: 32,),
                ))
      
      
          ],
        ),
      
      ),
    );
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;
    double centerWidth = w / 2;
    double radius = 33;


    path.lineTo(centerWidth - radius -1, 0); // Start from left
    path.quadraticBezierTo(
        centerWidth - radius, 34, centerWidth, 3); // Left curve
    path.quadraticBezierTo(
        centerWidth + radius, 34, centerWidth + radius + 1, 0); // Right curve
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}