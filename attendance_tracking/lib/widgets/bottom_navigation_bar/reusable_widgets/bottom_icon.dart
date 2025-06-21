import 'package:flutter/material.dart';
import 'package:attendance_tracking/controllers/navigation_controller.dart';
import 'package:get/get.dart';
import 'package:attendance_tracking/constants.dart';
class BottomIcon extends StatelessWidget {

  BottomIcon({required this.iconName,required this.index});
  final IconData iconName;
  final int index;
  NavigationController navigationController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      decoration: BoxDecoration(
          color: navigationController.selectedIndex.value==index?kBluePasswordVerification:Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: IconButton(
          onPressed:(){
            navigationController.updateIndex(index);
          },
          icon: Icon(
              iconName,
              size:index==navigationController.selectedIndex.value?33:25,
              color:index==navigationController.selectedIndex.value?Colors.white:Colors.black)
      ),
    ));
  }
}
