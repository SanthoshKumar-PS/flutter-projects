import 'package:flutter/material.dart';
import 'date_day.dart';
import 'package:intl/intl.dart';
class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Future<void> showDate(BuildContext context)async {
    DateTime? newDate=await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2200)
    );
    if(newDate!=null){
      print(newDate);
      print(DateFormat('dd:MM:yyyy EEE').format(newDate));
    }
  }
  DateTime currentDate=DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
              itemBuilder: (context,index){
              DateTime today=currentDate.subtract(Duration(days: index));
              String date=DateFormat('dd').format(today);
              String day=DateFormat('EEE').format(today);
                return Row(
                  children: [
                    DateDay(date: date, day: day),
                    SizedBox(width: 5),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
