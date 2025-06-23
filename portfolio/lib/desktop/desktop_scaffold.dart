import 'package:flutter/material.dart';
import 'package:portfolio/desktop/about_page.dart';
import 'package:portfolio/desktop/contact_page.dart';
import 'package:portfolio/desktop/home_page.dart';
import 'package:portfolio/desktop/project_page.dart';
import 'package:portfolio/desktop/publication_page.dart';
import 'package:portfolio/desktop/skills_page.dart';
import '../constants.dart';
import '../desktop_reusable_components/text_buttons.dart';
import 'experience_page.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }
  void _onScroll() {
    final scrollOffset = scrollController.offset;

    double getOffset(GlobalKey key) {
      final context = key.currentContext;
      if (context == null) return double.infinity;
      final box = context.findRenderObject() as RenderBox;
      return box.localToGlobal(Offset.zero).dy + scrollOffset;
    }

    final sectionOffsets = {
      'Home': getOffset(homeKey),
      'About': getOffset(aboutKey),
      'Experience': getOffset(experienceKey),
      'Projects': getOffset(projectKey),
      'Skills': getOffset(skillsKey),
      'Publications': getOffset(publicationKey),
      'Contact': getOffset(contactKey),
    };

    // Sort sections by offset
    final sortedSections = sectionOffsets.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    String newSection = selectedSection;

    for (int i = 0; i < sortedSections.length; i++) {
      final currentOffset = sortedSections[i].value;
      final nextOffset = (i + 1 < sortedSections.length)
          ? sortedSections[i + 1].value
          : double.infinity;

      if (scrollOffset >= currentOffset - 100 &&
          scrollOffset < nextOffset - 100) {
        newSection = sortedSections[i].key;
        break;
      }
    }

    if (newSection != selectedSection) {
      setState(() {
        selectedSection = newSection;
      });
    }
  }
  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  final ScrollController scrollController=ScrollController();
  final GlobalKey homeKey=GlobalKey();
  final GlobalKey aboutKey=GlobalKey();
  final GlobalKey experienceKey=GlobalKey();
  final GlobalKey projectKey=GlobalKey();
  final GlobalKey skillsKey=GlobalKey();
  final GlobalKey contactKey=GlobalKey();
  final GlobalKey publicationKey=GlobalKey();

  String selectedSection = "Home";


  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  void updateSection(String section) {
    setState(() {
      selectedSection = section;
    });

    switch (section) {
      case "Home":
        scrollToSection(homeKey);
        break;
      case "About":
        scrollToSection(aboutKey);
        break;
      case "Experience":
        scrollToSection(experienceKey);
        break;
      case "Projects":
        scrollToSection(projectKey);
        break;
      case "Skills":
        scrollToSection(skillsKey);
        break;
      case "Contact":
        scrollToSection(contactKey);
        break;
      case "Publications":
        scrollToSection(publicationKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = screenWidth / (16 / 1); // Because aspectRatio = 16:1
    final remainingHeight = screenHeight - appBarHeight;
    bool isTabletSize= screenWidth<715;
    //Below is for devices with very small width <=715

    print("Height ${remainingHeight} Width ${screenWidth}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16/1,
              child: Container(
                color: kAppBarDarkColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (screenWidth>780)?
                        Row(
                          children: [
                            SizedBox(width: 30,),
                            Text("SKPS",style: tButtonTextStyle,),
                          ],
                        ):SizedBox(),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: isTabletSize?MainAxisAlignment.spaceAround:MainAxisAlignment.end,
                        children: [
                          TextButtons(text: "Home",iconName: Icons.home ,selectedSection: selectedSection, onPressed: updateSection, isTabletSize: isTabletSize,),
                          TextButtons(text: "About",iconName: Icons.info_outline , selectedSection: selectedSection, onPressed: updateSection, isTabletSize: isTabletSize ),
                          TextButtons(text: "Experience",iconName: Icons.work_outline, selectedSection: selectedSection, onPressed: updateSection, isTabletSize: isTabletSize ),
                          TextButtons(text: "Projects",iconName: Icons.dashboard_customize, selectedSection: selectedSection, onPressed: updateSection, isTabletSize: isTabletSize ),
                          TextButtons(text: "Skills",iconName: Icons.school , selectedSection: selectedSection, onPressed: updateSection, isTabletSize: isTabletSize ),
                          TextButtons(text: "Publications",iconName: Icons.article_outlined, selectedSection: selectedSection, onPressed: updateSection, isTabletSize: isTabletSize ),
                          TextButtons(text: "Contact",iconName: Icons.phone, selectedSection: selectedSection, onPressed: updateSection, isTabletSize: isTabletSize ),
                          SizedBox(width: 50),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),//AppBar

            SizedBox(
              height: remainingHeight,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [

                    HomePage(homeKey: homeKey,screenHeight: remainingHeight, screenWidth: screenWidth, updateSection: updateSection,), //Home Page

                    AboutPage(aboutKey: aboutKey, height: remainingHeight, screenWidth: screenWidth,),
                    //About Page Ends here

                    ExperiencePage(experienceKey: experienceKey, screenWidth: screenWidth,),

                    ProjectPage(projectKey: projectKey,screenHeight: screenHeight,),

                    SkillsPage(skillsKey: skillsKey, height: remainingHeight,),

                    PublicationPage(publicationKey:publicationKey,screenHeight: remainingHeight),

                    ContactPage(contactKey: contactKey, screenHeight: remainingHeight),



                  ],
                ),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
