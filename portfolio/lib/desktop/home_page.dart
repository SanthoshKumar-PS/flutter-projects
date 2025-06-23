import 'package:flutter/material.dart';
import 'package:portfolio/desktop_reusable_components/redirecting_button.dart';

import '../constants.dart';
import '../credentials.dart';
import '../desktop_reusable_components/animated_text.dart';
import '../desktop_reusable_components/text_buttons.dart';
import '../method_constants.dart';

class HomePage extends StatelessWidget {
  final GlobalKey homeKey;
  final double screenHeight;
  final double screenWidth;
  final Function updateSection;
  const HomePage({super.key, required this.homeKey, required this.screenHeight, required this.screenWidth, required this.updateSection});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: homeKey,
      constraints: BoxConstraints(
        minHeight: screenHeight,
      ),
      width: double.infinity,
      color: kAppBarDarkColor,
      child: (screenWidth>760)?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomePageContent(updateSection: updateSection,), //In this same file
                      HomePageImage(),

                    ],
                  ):
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomePageImage(),
                      HomePageContent(updateSection: updateSection,),//In this same file
                    ],
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
      minRadius: MediaQuery.of(context).size.width*0.10,
      maxRadius: MediaQuery.of(context).size.width*0.10,
      backgroundImage: NetworkImage('assets/images/profile.jpg'),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final Function updateSection;
  const HomePageContent({
    super.key, required this.updateSection,
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
        SizedBox(height: 25),
        Row(
          children: [
            GestureDetector(
              onTap: (){
                updateSection("Contact");
              },
              child: RedirectingButton(buttonString: 'Contact Me',),
            ),
            SizedBox(width: 15),
            GestureDetector(
              onTap: (){
                openWithHttpsLink(resumeLink);
              },
              child: RedirectingButton(buttonString: 'Resume'),
            ), // Resume

          ],
        ),
        SizedBox(height: 25),



      ],
    );
  }
}
