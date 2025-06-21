import 'package:get/get.dart';

class CheckinCheckoutController extends GetxController{
  RxBool checkInOut =true.obs; //if true user is in Checked Out mode ,false means checkin mode
  void updateChechInOut(bool value){
    checkInOut.value=value;
  }
}