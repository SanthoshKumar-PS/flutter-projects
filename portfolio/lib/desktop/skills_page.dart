import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constants.dart';
import '../desktop_reusable_components/skills_card_box.dart';

class SkillsPage extends StatelessWidget {
  final GlobalKey skillsKey;
  final double height;
  const SkillsPage({super.key, required this.skillsKey, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: height,
      ),
      key: skillsKey,
      color: kGreyWhiteBgColor,
      width: double.infinity,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 15),
          GradientText(
            'Skills',
            style: tHeadingTextStyle.copyWith(fontSize: 35),
            colors: [
              Color(0xFF4661C5),
              Color(0xFF07BEAA)
            ],
          ),
          SizedBox(height: 15),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              SkillsCardBox(
                heading: 'Backend Development',
                items: [
                  'Node.js',
                  'Express',
                  'Firebase',
                  'MongoDB',
                  'Mongoose',
                  'PostgreSQL',
                  'SQL',
                  'RESTful APIs',
                  'Authentication',
                ],
              ),
              SkillsCardBox(
                heading: 'Frontend Development',
                items: [
                  'Flutter',
                  'Dart',
                  'Responsive Design',
                  'Flutter Animations',
                  'State Management (Provider)',
                ],
              ),
              SkillsCardBox(
                heading: 'Programming Languages',
                items: [
                  'Python',
                  'Dart',
                  'JavaScript',
                  'Java',
                  'SQL',
                  'NOSQL'
                ],
              ),
              SkillsCardBox(
                heading: 'Database',
                items: [
                  'MongoDB',
                  'Firebase Firestore',
                  'PostgreSQL',
                  'SQL',
                ],
              ),

            ],
          ),
          SizedBox(height: 15),


        ],
      ),

    );
  }
}
