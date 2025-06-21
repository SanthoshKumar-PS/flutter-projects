import 'package:get/get.dart';

class EmailPhoneController extends GetxController{
  RxString emailPhone="".obs;
  void updateValue(String name){
    emailPhone.value=name;
    //print("value updated to ${emailPhone.value}");
  }

}