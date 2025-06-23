import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../constants.dart';
import '../mobile_reusable_components/skills_card_box.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:portfolio/constants.dart';

class SkillsPage extends StatelessWidget {
  final GlobalKey skillsKey;
  final double height;
  SkillsPage({super.key, required this.skillsKey, required this.height});
  List<Widget> skillsList=[
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
        'State Management',
        'Provider'
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
    )

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        // minHeight: height,
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
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Swiper(
                itemCount: 4,
              itemBuilder: (context,index){
                  return skillsList[index];

              },
              autoplay: false,
              duration: 1000,
              loop: true,
              viewportFraction: 0.7, // Show next/previous card edges
              scale: 0.8, // Shrink the side cards slightly
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 380),
                builder: DotSwiperPaginationBuilder(
                  color: Colors.white54,    // Inactive dot color
                  activeColor: kAppBarDarkColor.withOpacity(0.8),           // Active dot color
                  size: 8.0,
                  activeSize: 10.0,
                ),
              ), // Optional dots
              control: const SwiperControl(),
            ),
          ),
          SizedBox(height: 15),


        ],
      ),

    );
  }
}
