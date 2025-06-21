import 'package:attendance_tracking/widgets/Leaves/leaves.dart';
import 'package:attendance_tracking/widgets/apply_leave/apply_leave.dart';
import 'package:attendance_tracking/widgets/password_and_verification/forgot_password.dart';
import 'package:attendance_tracking/widgets/home_page/home_page.dart';
import 'package:attendance_tracking/widgets/profile_page/my_profile.dart';
import 'package:attendance_tracking/widgets/team/holiday_list.dart';
import 'package:attendance_tracking/widgets/team/team_list.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController{
  RxInt selectedIndex=0.obs;
  RxList<Widget> pagesNavigation=[HomePage(),Leaves(),HolidayList(),MyProfile()].obs;
  Rx<Widget> currentPage = Rx<Widget>(HomePage());
  void updateIndex(int index){
    selectedIndex.value=index;
    currentPage.value=pagesNavigation[selectedIndex.value];
    //print(selectedIndex.value);
  }




}