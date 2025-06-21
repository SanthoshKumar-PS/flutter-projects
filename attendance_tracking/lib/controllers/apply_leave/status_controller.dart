import 'package:get/get.dart';
class StatusController extends GetxController{
  RxString statusValue="null".obs;
  void updateStatus(String value){
    statusValue.value=value;
    print("update value is ${statusValue.value}");

  }
}