import 'package:attendance_tracking/controller_initializer.dart';
import 'package:attendance_tracking/widgets/login_register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getroutes.dart';
import 'widgets/leaves/leaves.dart';
import 'widgets/leaves/team_leave/team_leave.dart';
import 'widgets/password_and_verification/timepass.dart';
import 'widgets/password_and_verification/forgot_password.dart';
import 'widgets/password_and_verification/verification_code.dart';
import 'widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'widgets/password_and_verification/new_password.dart';
import 'widgets/password_and_verification/congratulations.dart';
import 'widgets/apply_leave/apply_leave.dart';
import 'widgets/apply_leave/leave_applied_successfully.dart';
import 'widgets/apply_leave/leave_details.dart';
import 'widgets/home_page/home_page.dart';
import 'widgets/home_page/reusable_widgets/swipe_gesture.dart';
import 'widgets/home_page/reusable_widgets/testing.dart';

void main() {
  ControllerInitializer.initializeController();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginpage', // or your first screen
      getPages: appRoutes,
      home: LoginPage(),
      // home: SwipeGesture(),
    );
  }
}