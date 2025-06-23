import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants.dart';
import 'experience_caption.dart';

class ExperienceCard extends StatelessWidget {
  final String duration;
  final String role;
  final String company;
  final List<String> experiencePoints;
  const ExperienceCard({super.key, required this.duration, required this.role, required this.company, required this.experiencePoints});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width:450,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: kWhiteColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color:Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8,5, 8, 5),
              child: Text(duration,style: tCaptionTextStyle.copyWith(color: Colors.black),),
            ),
          ),
          Text(role,style: tSubheadingTextStyle.copyWith(color: kAppBarDarkColor,fontWeight: FontWeight.bold,fontSize: 20)),
          Text(company,style: tSubheadingTextStyle.copyWith(color: kAppBarDarkColor,fontSize: 18),),
          SizedBox(height: 5),
          ...experiencePoints.map((point)=>Column(
            children: [
              SizedBox(height: 5),
              ExperienceCaption(sentence: point),
            ],
          )),

        ],
      ),
    );
  }
}
