import 'package:flutter/material.dart';

import '../constants.dart';
import 'experience_caption.dart';

class EntireEducation extends StatelessWidget {
  const EntireEducation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Education',style: tBodyTextStyle.copyWith(fontSize: 18,color: kLightBlueColor),),
        SizedBox(height: 20),
        Container(
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
                  child: Text('2020-2024',style: tCaptionTextStyle.copyWith(color: Colors.black),),
                ),
              ),
              Text('B.E in Computer Science and Engineering',style: tSubheadingTextStyle.copyWith(color: kAppBarDarkColor,fontWeight: FontWeight.bold)),
              Text('Sri Krishna College Of Technology, Coimbatore',style: tSubheadingTextStyle.copyWith(color: kAppBarDarkColor),),

              ExperienceCaption(sentence: 'CGPA: 8.55'),
              ExperienceCaption(sentence: 'First Class With Distinction')


            ],
          ),
        )
      ],
    );
  }
}
