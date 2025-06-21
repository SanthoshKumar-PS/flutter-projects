import 'package:get/get.dart';
import 'controllers/apply_leave/leave_type_controller.dart';
import 'controllers/apply_leave/status_controller.dart';
import 'controllers/home_page/checkin_checkout_controller.dart';
import 'controllers/home_page/datecontroller.dart';
import 'controllers/emailphonecontroller.dart';
import 'controllers/navigation_controller.dart';


class ControllerInitializer{
  static void initializeController(){
    //apply_leave
    Get.lazyPut<LeaveTypeController>(()=>LeaveTypeController());
    Get.lazyPut<StatusController>(()=>StatusController());

    //home_page
   Get.lazyPut<CheckinCheckoutController>(()=>CheckinCheckoutController());
   Get.lazyPut<DateController>(()=>DateController());

    Get.lazyPut<EmailPhoneController>(()=>EmailPhoneController());
    Get.lazyPut<NavigationController>(()=>NavigationController());



  }
}