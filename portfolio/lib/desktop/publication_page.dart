import 'package:flutter/material.dart';
import 'package:portfolio/credentials.dart';
import 'package:portfolio/method_constants.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../desktop_reusable_components/experience_caption.dart';

class PublicationPage extends StatelessWidget {
  final GlobalKey publicationKey;
  final double screenHeight;
  PublicationPage({super.key, required this.screenHeight, required this.publicationKey});

  List<String> publicationPoints=[
  '• Built a Multi-Model Deep Learning System for early skin cancer detection using CNN, VGG16, and ResNet architectures to leverage complementary feature extraction strengths.',
  '• Achieved State-of-the-Art Accuracy through model fusion and transfer learning, significantly outperforming traditional single-model approaches on a comprehensive dermatological dataset.',
  '• Implemented Transfer Learning & Residual Learning to improve generalization, handle vanishing gradients, and train deeper models effectively for both benign and malignant lesion classification.',
  '• Delivered Robust and Interpretable Predictions across multiple skin cancer subtypes, providing explainable insights into model decision-making for enhanced clinical relevance.'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: screenHeight,
      ),
      width: double.infinity,
      color: kGreyWhiteBgColor,
      key: publicationKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10,),
          GradientText(
            'Publications',
            style: tHeadingTextStyle.copyWith(fontSize: 35),
            colors: [
              Color(0xFF4661C5),
              Color(0xFF07BEAA)
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: kWhiteFgColor,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Skin Cancer Detection Using MultiModel Neural Networks',style: tSubheadingTextStyle.copyWith(color: kAppBarDarkColor,fontWeight: FontWeight.bold,fontSize: 20)),
                Card(
                  color:Colors.lightBlueAccent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8,5, 8, 5),
                    child: Text('Feb 2024',style: tCaptionTextStyle.copyWith(color: Colors.black),),
                  ),
                ),
                Text('Scopus Migration',style: tSubheadingTextStyle.copyWith(color: kAppBarDarkColor,fontSize: 18),),
                GestureDetector(
                  onTap: () {
                    openWithHttpsLink(publicationArticle);
                  },
                    child: Text('Click Here To View Article',style: tSubheadingTextStyle.copyWith(color: kAppBarDarkColor,fontSize: 15,decoration: TextDecoration.underline,decorationColor: kAppBarDarkColor),)
                ),

                SizedBox(height: 5),

                ...publicationPoints.map((point)=>Column(
                  children: [
                    SizedBox(height: 5),
                    ExperienceCaption(sentence: point),
                  ],
                )),

              ],
            ),
          ),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
