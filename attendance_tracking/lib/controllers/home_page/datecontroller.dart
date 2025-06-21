import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController{
  String currentDate=DateFormat('dd').format(DateTime.now());
  RxString selectedDate="".obs;

  void onInit(){
    super.onInit();
    selectedDate.value=currentDate;
  }
  void updateDate(String date){
    selectedDate.value=date;
  }

}