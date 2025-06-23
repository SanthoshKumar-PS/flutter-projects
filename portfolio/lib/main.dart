import 'package:flutter/material.dart';
import 'package:portfolio/desktop/desktop_scaffold.dart';
import 'mobile/mobile_scaffold.dart';
import 'package:portfolio/responsive_layout.dart';

void main() {
  runApp( PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  PortfolioApp({super.key});
  GlobalKey<ScaffoldState> scaffoldState=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: ResponsiveLayout(
          mobileScaffold: MobileScaffold(),
          desktopScaffold: DesktopScaffold()
      ),


    );
  }
}
