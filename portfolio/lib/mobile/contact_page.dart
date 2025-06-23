import 'package:flutter/material.dart';
import 'package:portfolio/credentials.dart';
import 'package:portfolio/method_constants.dart';
import 'package:portfolio/mobile_reusable_components/textfield_contact.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constants.dart';
import '../mobile_reusable_components/contacting_card.dart';

class ContactPage extends StatelessWidget {
  final GlobalKey contactKey;
  final double screenHeight;
  final double screenWidth;
  ContactPage({super.key, required this.contactKey, required this.screenHeight, required this.screenWidth});

  GlobalKey formKey=GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      constraints: BoxConstraints(
        minHeight: screenHeight,
      ),
      key: contactKey,
      color: Colors.blue.shade400,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 15),
          GradientText(
            'Contact Me',
            style: tHeadingTextStyle.copyWith(fontSize: 35),
            colors: [
              Color(0xFF4661C5),
              Color(0xFF07BEAA)
            ],
          ),
          SizedBox(height: 15),
          Container(
            height: 450,
            width: screenWidth-32,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get In Touch',style: tHeadingTextStyle.copyWith(color: kAppBarDarkColor,fontWeight: FontWeight.bold,fontSize: 25)),
                  Text('Feel free to reach out for opportunities or just to say hello!',style: tBodyTextStyle.copyWith(color: Colors.black54),),
                  ContactingCard(contactMethod: 'Email', contactString: "santhoshkumarsakthi2003@gmail.com", iconName: Icons.email, urlMethod: emailUser,),
                  ContactingCard(contactMethod: 'Phone', contactString: "9597889163", iconName: Icons.phone, urlMethod: phoneUser),
                  ContactingCard(contactMethod: 'Location', contactString: 'Hosur, TamilNadu', iconName:Icons.location_city, urlMethod: openLocation),
                  ContactingCard(contactMethod: 'Github', contactString: 'github/SanthoshKumar-PS', iconName: Icons.file_copy, urlMethod: openGithub)
                ],
              ),
            ),

          ),
          SizedBox(height: 15),



        ],
      ),


    );
  }
}
