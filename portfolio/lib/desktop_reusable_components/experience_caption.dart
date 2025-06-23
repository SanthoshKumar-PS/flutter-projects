import 'package:flutter/material.dart';

import '../constants.dart';

class ExperienceCaption extends StatelessWidget {
  final String sentence;
  const ExperienceCaption({super.key, required this.sentence});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              text: sentence,
              style: tCaptionTextStyle.copyWith(color: Colors.black,fontSize: 16),
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
