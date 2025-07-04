import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget desktopScaffold;
  const ResponsiveLayout({super.key, required this.mobileScaffold, required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth<515){
            return mobileScaffold;
          }
          else{
            return desktopScaffold;
          }
    });
  }
}
