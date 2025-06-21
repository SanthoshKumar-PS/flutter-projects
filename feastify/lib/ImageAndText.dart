import 'package:flutter/material.dart';
import 'package:feastify/main.dart';


class ExpandedTwoChild extends StatelessWidget {
  ExpandedTwoChild({required this.imageName,required this.textContents});
  final String imageName;
  final String textContents;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ImageContainer(imageName: imageName),
          // SizedBox(height: 5),
          TextWidget(textContent: textContents)
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  ImageContainer({required this.imageName});
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70.0,
      decoration: BoxDecoration(
        color: kbackgroundColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imageName),
          fit: BoxFit.contain
        ),
      ),
    );
  }
}
class TextWidget extends StatelessWidget {
  TextWidget({required this.textContent});
  final String textContent;

  @override
  Widget build(BuildContext context) {
    return Text(textContent,style: TextStyle(decoration:TextDecoration.none,fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'NotoSerif'),);
  }
}

