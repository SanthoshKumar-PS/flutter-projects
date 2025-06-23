import 'package:flutter/material.dart';

import '../constants.dart';
import 'experience_card.dart';

class EntireExperience extends StatelessWidget {
  final bool started;
  const EntireExperience({
    super.key, required this.started,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: (started==false)?CrossAxisAlignment.start :CrossAxisAlignment.end,
      children: [
        Text('Experience',style: tBodyTextStyle.copyWith(fontSize: 18,color: kLightBlueColor),),
        SizedBox(height: 20),
        ExperienceCard(
            duration: 'Apr-May2020',
            role: 'Web Developer',
            company: 'PageOn Top, Coimbatore',
            experiencePoints: [
              '• Developed and optimized responsive web applications using HTML, CSS, JavaScript, and TypeScript.',
              '• Designed and implemented dynamic UI components to enhance user experience.',
              '• Integrated Web APIs for seamless front-end and back-end communication.',
              '• Gained hands-on experience in modern web development frameworks and best coding practices.'

            ]
        ),
        SizedBox(height: 20),
        ExperienceCard(
            duration: 'Jan 2025-Apr 2025',
            role: 'Flutter Development Intern',
            company: 'Diggibyte Technologies, Hosur',
            experiencePoints: [
              '• Contributed to the design and development of an internal Asset Management System application using Flutter, ensuring a responsive and user-friendly interface across devices.',
              '• Collaborated closely with the backend team to build RESTful APIs using Node.js, Express, MongoDB, and Mongoose, effectively managing asset data and authentication workflows',
              '• Participated in regular code reviews, testing, and debugging sessions to ensure stability and performance before deployment, resulting in a smooth rollout within the organization.'
            ]
        )
      ],
    );
  }
}
