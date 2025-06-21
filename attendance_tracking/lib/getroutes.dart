import 'package:attendance_tracking/widgets/apply_leave/apply_leave.dart';
import 'package:attendance_tracking/widgets/apply_leave/leave_filter.dart';
import 'package:attendance_tracking/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:attendance_tracking/widgets/login_register/Register_page.dart';
import 'package:attendance_tracking/widgets/login_register/login_page.dart';
import 'package:attendance_tracking/widgets/password_and_verification/forgot_password.dart';
import 'package:attendance_tracking/widgets/password_and_verification/verification_code.dart';
import 'package:attendance_tracking/widgets/team/team_list.dart';
import 'package:get/get.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: '/bottomnavigation',
    page: () => BottomNavigation(),
  ),
  GetPage(
    name: '/loginpage',
    page: () => LoginPage(),
  ),
  GetPage(
    name: '/registerpage',
    page: () => RegisterPage(),
  ),
  GetPage(
    name: '/forgotpassword',
    page: () => ForgotPassword(),
  ),
  GetPage(
    name: '/verificationcode',
    page: () => VerificationCode(),
  ),

  GetPage(
    name: '/teamlist',
    page: () => TeamList(),
  ),
  GetPage(
    name: '/applyleave',
    page: () => ApplyLeave(),
  ),




  // Add more routes here
];
