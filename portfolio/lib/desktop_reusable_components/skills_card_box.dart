import 'package:flutter/material.dart';
import 'package:portfolio/desktop_reusable_components/skill_card.dart';

import '../constants.dart';

class SkillsCardBox extends StatelessWidget {
  final String heading;
  final List<String> items;
  const SkillsCardBox({super.key, required this.heading, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
          color: kWhiteFgColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4),
            )
          ]

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(heading,style: tSubheadingTextStyle.copyWith(color: kAppBarDarkColor,fontWeight: FontWeight.bold,fontSize: 20,)),
          Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 10,
              children: items.map((item){
                return SkillCard(skillText: item);
              }).toList()
          ),

        ],
      ),
    );
  }
}
