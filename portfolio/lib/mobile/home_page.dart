import 'package:flutter/material.dart';
import '../constants.dart';
import '../credentials.dart';
import '../method_constants.dart';
import '../mobile_reusable_components/animated_text.dart';
import '../mobile_reusable_components/text_buttons.dart';
import '../mobile_reusable_components/redirecting_button.dart';
class HomePage extends StatelessWidget {
  final GlobalKey homeKey;
  final double screenHeight;
  final double screenWidth;
  final Function(String)? updateSection;
  const HomePage({super.key, required this.homeKey, required this.screenHeight, required this.screenWidth, this.updateSection});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: homeKey,
      constraints: BoxConstraints(
        minHeight: screenHeight,
      ),
      width: double.infinity,
      color: kAppBarDarkColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomePageImage(),
            HomePageContent(updateSection: updateSection,), //In this same file
          ],
        ),
      )
    );
  }
}

class HomePageImage extends StatelessWidget {
  const HomePageImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: MediaQuery.of(context).size.width*0.20,
      maxRadius: MediaQuery.of(context).size.width*0.20,
      backgroundImage: AssetImage('assets/images/profile.jpg'),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final Function(String)? updateSection;
  const HomePageContent({
    super.key, this.updateSection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextWidget(text: 'Hi, I am Santhosh Kumar P S',fontSize:40),
        SizedBox(height: 25),
        AnimatedTextWidget(text: "Mobile Application Developer &\nComputer Science Engineer"),
        SizedBox(height: 25),
        SizedBox(
          width: 550,
          child: Text.rich(
            TextSpan(
                text: "A motivated and detail-oriented Computer Science graduate with a strong passion for developing scalable, user-friendly web and mobile applications. Committed to continuous learning and building impactful digital solutions.",
                style: tCaptionTextStyle
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 15),
        Row(
          children: [
            GestureDetector(
              onTap: (){
                updateSection!("Contact");
              },
              child: RedirectingButton(buttonString: 'Contact Me'),
            ),
            SizedBox(width: 15),
            GestureDetector(
              onTap: (){
                openWithHttpsLink(resumeLink);
              },
              child: RedirectingButton(buttonString: 'Resume'),
            ), // Resume

          ],
        ), // Resume




      ],
    );
  }
}
