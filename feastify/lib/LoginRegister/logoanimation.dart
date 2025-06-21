import 'package:flutter/material.dart';

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({
    super.key,
    required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.bounceInOut,
          tween: Tween<double>(begin: 0,end: 200),
          builder: (context,size,widget) {
            return FadeTransition(
                opacity:animation,
                child: Image(image: AssetImage('images/applogos/zippybytelogo.png'),width: size,height:size)
            );
          }
      ),
    );
  }
}


