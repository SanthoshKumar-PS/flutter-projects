import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:portfolio/method_constants.dart';
class ProjectCard extends StatefulWidget {
  final String projectName;
  final String subTitle;
  final String projectContent;
  final String githubLink;
  final String imagePath;
  ProjectCard({super.key, required this.projectName, required this.subTitle, required this.projectContent,required this.githubLink, required this.imagePath});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool onHovering=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        openWithHttpsLink(widget.githubLink);

      },
      child: MouseRegion(
        onEnter: (_){
          setState(() {
            onHovering=true;
          });
        },
        onExit: (_){
          setState(() {
            onHovering=false;
          });
        },
        child: Container(
          height: 275,
          width: MediaQuery.of(context).size.width*0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: kWhiteFgColor,
            boxShadow: [
              onHovering?BoxShadow(
                color: kAppBarDarkColor.withOpacity(0.8), // Shadow color
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 0),
              ):
                BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 0),
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height:150,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.contain,
                    ),
                  )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.projectName,style: tHeadingTextStyle.copyWith(decoration: TextDecoration.underline,decorationColor: kAppBarDarkColor,decorationThickness: 2,color: kAppBarDarkColor,fontSize: 15,),textAlign: TextAlign.center),
                      Text(widget.subTitle,style: tBodyTextStyle.copyWith(fontSize:12,color: Colors.grey.shade500,fontWeight: FontWeight.w200),),
                      Text.rich(
                        TextSpan(
                          text: widget.projectContent,
                          style: tCaptionTextStyle.copyWith(color: Colors.black,fontSize: 12),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
