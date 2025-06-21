import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:attendance_tracking/constants.dart';
import 'reusable_widgets/date_day.dart';
import 'reusable_widgets/total_attendance_boxes.dart';
import 'reusable_widgets/your_activity_box.dart';
import 'package:attendance_tracking/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:intl/intl.dart';
import 'package:attendance_tracking/controllers/home_page/datecontroller.dart';
import 'package:get/get.dart';
import 'package:attendance_tracking/controllers/home_page/checkin_checkout_controller.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

   DateController dateController=Get.find();
   CheckinCheckoutController checkinCheckoutController =Get.find();

   @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              leading: CircleAvatar(
                                radius: 28,
                                backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMGltYWdlfGVufDB8fDB8fHww",
                                ),
                              ),
                              title: Text('Michael Mitc',style: kEmailPhoneText.copyWith(fontSize: 20)),
                              subtitle: Text('Lead UI/UX Designer',style: kLeaveDetailsHeader,),
                              trailing: Container(
                                padding: EdgeInsets.all(10),
                                //height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kLightBorderColor, width: 1),
                                ),
                                  child: Icon(Iconsax.notification,size:28)
                              ),
                            ),//User image, name, role
                            SizedBox(height: 25),
                            SizedBox(
                              height: 75,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                  itemBuilder: (context,index){
                                    DateTime currentDate=DateTime.now().add(Duration(days: index-2));
                                    String date=DateFormat('dd').format(currentDate);
                                    String day=DateFormat('EEE').format(currentDate);
                                    return Row(
                                      children: [
                                        DateDay(date: date,day: day),
                                        SizedBox(width: 15)
                                      ],
                                    );

                              }
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),//ListTile and Dates Row
                      Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F7F7),
                          //borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Today Attendance',style: kEmailPhoneText),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    TotalAttendanceBoxes(iconName: Iconsax.login, heading: 'Check In', time: '10:00 am', timeStatus: 'On Time'),
                                    SizedBox(width: 16),
                                    TotalAttendanceBoxes(iconName: Iconsax.logout, heading: 'Check Out', time: '07:00 pm', timeStatus: 'Go Home')
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    TotalAttendanceBoxes(iconName: Iconsax.coffee, heading: 'Break Time', time: '00:30 min', timeStatus: 'Avg Time 30 min'),
                                    SizedBox(width: 16),
                                    TotalAttendanceBoxes(iconName: Iconsax.calendar, heading: 'Total Days', time: '28', timeStatus: 'Working Days')
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Your Activity',style: kEmailPhoneText),
                                    Text('View All',style: kLeaveDetailsHeader.copyWith(color: kBluePasswordVerification)),

                                  ],
                                ),
                                SizedBox(height: 10),
                                YourActivityBox(iconName: Iconsax.login, heading: 'Check In', date: 'April 17,2023', time: '10:00 am', timeStatus: 'On Time'),
                                SizedBox(height: 10),
                                YourActivityBox(iconName: Iconsax.coffee, heading: 'Break In', date: 'April 17,2023', time: '12:30 pm', timeStatus: 'On Time')


                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Obx(()=>Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SlideAction(
                    height: 60,
                    text: checkinCheckoutController.checkInOut.value?'Slide to Check In':"Slide to Check Out",
                    textStyle: kLeaveDetailsHeader.copyWith(color: kBackgroundColor,fontSize: 17),
                    borderRadius: 12,
                    elevation: 2,
                    innerColor: kBackgroundColor,
                    outerColor: checkinCheckoutController.checkInOut.value?kBluePasswordVerification:Color(0xFFFE8B81),
                    sliderButtonIcon: Icon(Icons.arrow_forward,color: checkinCheckoutController.checkInOut.value?kBluePasswordVerification:Color(0xFFFE8B81),),
                    sliderButtonIconPadding: 12,
                    sliderButtonYOffset: 2,
                    onSubmit: (){
                      print("Submitted");
                      if(checkinCheckoutController.checkInOut.value==true){
                        checkinCheckoutController.updateChechInOut(false);
                      }
                      else{
                        checkinCheckoutController.updateChechInOut(true);
                      }
                      },
                  ),
                ),),//Swipe Gesture

              SizedBox(height: 115),
            ],
          ),
          // bottomNavigationBar:BottomNavigation() ,
        )
    );
  }
}

