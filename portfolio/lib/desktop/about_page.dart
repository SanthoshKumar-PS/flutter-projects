import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import '../credentials.dart';
import '../desktop_reusable_components/contact_card.dart';
import 'package:portfolio/method_constants.dart';

class AboutPage extends StatelessWidget {
  final GlobalKey aboutKey;
  final double height;
  final double screenWidth;
  const AboutPage({super.key, required this.aboutKey, required this.height, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: height,

      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ kAppBarDarkColor, const Color(0xFF64B5F6)], // dark blue to light blue
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      key:aboutKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: [
              ContactCard(iconName: Icons.mail, contact: "santhoshkumarsakthi2003@gmail.com", performMethod: desktopEmailUser),
              ContactCard(iconName: Icons.phone, contact: "+91-9597889163",performMethod: phoneUser),
              ContactCard(iconName: Icons.folder_copy_rounded, contact: "github/SanthoshKumar-PS", performMethod: openGithub),
              ContactCard(iconName: Icons.location_pin, contact: "Hosur", performMethod: openLocation,)

            ],
          ),
          GradientText(
            'About Me',
            style: tHeadingTextStyle.copyWith(fontSize: 35),
            colors: [
              Color(0xFF4661C5),
              Color(0xFF07BEAA)
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Text.rich(
              TextSpan(
                  text: "A passionate and detail-oriented Computer Science graduate with a strong foundation in Flutter, Python, and modern web technologies. I love transforming ideas into real-world mobile and web applications that are intuitive, efficient, and impactful.\nI enjoy solving problems, optimizing UI/UX, and constantly pushing myself to learn new technologies. Currently, I’m focused on building full-stack applications and enhancing my skills in backend development, cloud integration, and data-driven design.\nWhen I’m not coding, I enjoy learning through community contributions, building side projects, and preparing myself for a future in tech innovation.\nI’m also exploring content creation to enhance my communication skills and share my knowledge with the developer community.",

                  style: tCaptionTextStyle.copyWith(fontSize: 20,color: kTextColor)
              ),
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
            ),

          ),
          SizedBox(height: 10,)

        ],
      ),
    );
  }
}
