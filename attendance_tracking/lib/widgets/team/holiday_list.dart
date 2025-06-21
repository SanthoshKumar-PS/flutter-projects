import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:iconsax/iconsax.dart';

class HolidayList extends StatefulWidget {
  const HolidayList({super.key});

  @override
  State<HolidayList> createState() => _HolidayListState();
}

class _HolidayListState extends State<HolidayList> {
  final List<Map<String, String>> holidays = [
    {"date": "January 1,2025", "name": "New Year's Day", "day":"Wednesday"},
    {"date": "January 26,2025", "name": "Republic Day", "day":"Sunday"},
    {"date": "March 8,2025", "name": "Women's Day", "day":"Saturday"},
    {"date": "April 14,2025", "name": "Tamil New Year", "day":"Monday"},
    {"date": "May 1,2025", "name": "Labour Day", "day":"Thursday"},
    {"date": "August 15,2025", "name": "Independence Day", "day":"Friday"},
    {"date": "October 2,2025", "name": "Gandhi Jayanti", "day":"Thursday"},
    {"date": "December 25,2025", "name": "Christmas", "day":"Thursday"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kVeryLightGrey,
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text(
          'Holiday List',
          style: TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontFamily: 'Lexend',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: holidays.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 11.0),
              child: Container(
                height: 112,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: index<3?[kLightGrey, kWhite]:[Colors.blue, kWhite],
                    stops: [0.04, 0],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Iconsax.calendar_1, size: 20),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                holidays[index]["date"]!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Lexend',
                                ),
                              ),
                            ],
                          ),
                          Text(holidays[index]["day"]!,style: TextStyle(
                            color: kLightGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lexend',
                          ),)
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            holidays[index]["name"]!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Lexend',
                            ),
                          ),
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
