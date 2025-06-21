import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> days = List.generate(
      10,
      (index) => DateFormat('MMMM dd,yyyy').format(
        DateTime.now().add(
          Duration(days: index),
        ),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new,size: 18,),
        title: Text(
          'Attendance List',
          style: TextStyle(
              color: kBlack,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [Colors.blue, kWhite],
                        stops: [0.05, 0.05],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        days[index],
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Lexend'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: kLightBlack,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              Icons.login,
                              color: Colors.blue,
                              size: 17,
                              weight: 700,
                            ),
                          ),
                          Text(
                            '10:12 am',
                            style: TextStyle(fontFamily: 'Lexend'),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: kLightBlack,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              size: 17,
                              weight: 700,
                              Icons.logout,
                              color: Colors.blue,
                            ),
                          ),
                          Text('7:00 pm',
                              style: TextStyle(fontFamily: 'Lexend')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
