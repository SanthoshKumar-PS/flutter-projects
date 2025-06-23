import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constants.dart';
import '../desktop_reusable_components/entire_education.dart';
import '../desktop_reusable_components/entire_experience.dart';
import '../desktop_reusable_components/experience_caption.dart';
import '../desktop_reusable_components/experience_card.dart';

class ExperiencePage extends StatelessWidget {
  final GlobalKey experienceKey;
  final double screenWidth;
  final bool started;

  ExperiencePage({super.key, required this.experienceKey, required this.screenWidth}):started= screenWidth>943;

  @override
  Widget build(BuildContext context) {
    return Container(
        key: experienceKey,
        color: kGreyWhiteBgColor,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              GradientText(
                'Experience & Education',
                style: tHeadingTextStyle.copyWith(fontSize: 35),
                colors: [
                  Color(0xFF4661C5),
                  Color(0xFF07BEAA)
                ],
              ),
              SizedBox(height: 10),
              started==true?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EntireExperience(started: started),
                        SizedBox(width: 20),
                        Container(
                          width: 5,
                          height: 885,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                kAppBarDarkColor.withOpacity(0.8),         // Top color
                                kLightBlueColor,    // Bottom color
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12), // Optional: rounded corners
                          ),
                        ),//Center Line Double Colored
                        SizedBox(width: 20),
                        EntireEducation()
                      ],

                    ):
                    Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      alignment: WrapAlignment.center,
                      children: [
                        EntireExperience(started: started),
                        EntireEducation()
                      ],
                    ),

              SizedBox(height: 10),

            ]
        )

    );
  }
}


