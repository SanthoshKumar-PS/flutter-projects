import 'package:get/get.dart';

class LeaveTypeController extends GetxController{
  RxString leaveTypeValue="null".obs;
  void updateLeaveType(String value){
    leaveTypeValue.value=value;
  }
}