import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  double? fontSize;
  AnimatedTextWidget({super.key, required this.text,this.fontSize=0});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(text,
            textStyle: fontSize==0?tSubheadingTextStyle:tSubheadingTextStyle.copyWith(fontSize: fontSize)
        ),

      ],
      totalRepeatCount: 1,
      isRepeatingAnimation: false,
      pause: const Duration(milliseconds: 1000),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
