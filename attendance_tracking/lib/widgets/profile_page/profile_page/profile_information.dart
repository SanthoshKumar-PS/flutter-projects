import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'personal_professional/document_profile.dart';
import 'personal_professional/personal_profile.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  int borderRadius = 0;
  int borderRadiusLast = 2;
  List<String> containerNames = ['Personal', 'Professional', 'Documents'];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'Poppins', fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  height: 55,
                width: screenWidth - 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: List.generate(
                      3,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                selectedIndex = index;
                              },
                            );
                          },
                          child: Container(
                            height: 55,
                            width: (screenWidth / 3) - 12,
                            decoration: BoxDecoration(
                              borderRadius: selectedIndex == index
                                  ? BorderRadius.all(Radius.circular(10))
                                  : BorderRadius.zero,
                              color: selectedIndex == index
                                  ? Colors.blue
                                  : kVeryLightGrey,
                            ),
                            child: Center(
                              child: Text(
                                containerNames[index],
                                style: TextStyle(
                                    color: selectedIndex == index
                                        ? kWhite
                                        : kBlack),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (selectedIndex == 0) ...[
                  Column(
                    children: [
                      PersonalInformationDetails(
                          text: 'Full Name', subtext: 'Michael Mitc'),
                      PersonalInformationDetails(
                          text: 'Email Address',
                          subtext: 'Michael.mitc@example.com'),
                      PersonalInformationDetails(
                          text: 'Phone Number', subtext: '(603)555-0123'),
                      PersonalInformationDetails(
                          text: 'Address',
                          subtext: '3517 W.Gray st.Utica,Pennsylvania 57867'),
                    ],
                  ),
                ],
                if (selectedIndex == 1) ...[
                  Column(
                    children: [
                      PersonalInformationDetails(
                          text: 'Employee ID', subtext: '7879987'),
                      PersonalInformationDetails(
                          text: 'Designation', subtext: 'Lead UI/UX Designer'),
                      PersonalInformationDetails(
                          text: 'Company Email Address',
                          subtext: 'Michael.mitc@example.com'),
                      PersonalInformationDetails(
                          text: 'Employee Type', subtext: 'Permanent'),
                      PersonalInformationDetails(
                          text: 'Department ', subtext: 'Design'),
                      PersonalInformationDetails(
                          text: 'Reporting Manager', subtext: 'Robert Fox'),
                      PersonalInformationDetails(
                          text: 'Company Experience', subtext: '(603)555-0123'),
                      PersonalInformationDetails(
                          text: 'Office Time', subtext: '10:00 am to 7:00 pm'),
                    ],
                  ),
                ],
                if (selectedIndex == 2) ...[
                 DocumentProfile(text: 'Offer Letter'),
                  DocumentProfile(text: 'Appointment Letter'),
                  DocumentProfile(text: 'Bond Agreement'),
                  DocumentProfile(text: 'Appraisal Letter'),
                  DocumentProfile(text: 'Salary Slip'),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
