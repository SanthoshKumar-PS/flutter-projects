import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constants.dart';
import '../mobile_reusable_components/entire_education.dart';
import '../mobile_reusable_components/entire_experience.dart';
import '../mobile_reusable_components/experience_caption.dart';
import '../mobile_reusable_components/experience_card.dart';

class ExperiencePage extends StatelessWidget {
  final GlobalKey experienceKey;
  final double screenWidth;

  ExperiencePage({super.key, required this.experienceKey, required this.screenWidth});

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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GradientText(
                  'Experience & Education',
                  style: tHeadingTextStyle.copyWith(fontSize: 30),
                  colors: [
                    Color(0xFF4661C5),
                    Color(0xFF07BEAA)
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    EntireExperience(started: false),
                    EntireEducation()
                  ],
                ),
              ),

              SizedBox(height: 10),

            ]
        )

    );
  }
}


