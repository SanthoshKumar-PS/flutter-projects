import 'package:attendance_tracking/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 18,
            weight: 700,
          ),
        ),
        title: Text(
          'Terms and Condition',
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              fontFamily: 'AfacadFlux'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              _buildText('Last updated:06/03/2025', Colors.grey, 15, null),
              const SizedBox(
                height: 11,
              ),
              _buildText(
                  'Please read these terms of service,carefully before using our app operated by us.',
                  Colors.black,
                  17,
                  null),
              const SizedBox(
                height: 10,
              ),
              _buildText(
                  'Conditions of Uses', Colors.blue, 19, FontWeight.bold),
              const SizedBox(
                height: 10,
              ),
              _buildText(
                  'By using this application, you agree to abide by the terms and conditions outlined herein. The application is provided for your personal use, and any misuse, unauthorized access, or unlawful activity will result in the termination of your access. We value your privacy and ensure that your personal data will be protected in accordance with our Privacy Policy. However, we are not responsible for any data loss, interruption of service, or technical errors that may occur during the usage of the application. All content, trademarks, and data provided in the application remain the property of their respective owners and must not be reproduced or misused without prior consent. Any violation of these terms may result in suspension or permanent termination of your account without prior notice. By continuing to use this application, you acknowledge that you have read, understood, and agreed to these terms and conditions.',
                  Colors.black,
                  18,
                  FontWeight.w500),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildText(
    String text, Color color, double fontSize, FontWeight? fontWeight) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'AfacadFlux'),
  );
}
