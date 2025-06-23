import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class SkillCard extends StatelessWidget {
  final String skillText;
  const SkillCard({super.key, required this.skillText});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: const LinearGradient(
        colors: [Color(0xFF0D47A1), Color(0xFF64B5F6)], // dark blue to light blue
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(10,5,10,5),
        child: Text(skillText,style: tBodyTextStyle,),
      ),
    );
  }
}
