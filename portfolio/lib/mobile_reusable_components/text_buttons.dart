import 'package:flutter/material.dart';

import '../constants.dart';

class TextButtons extends StatefulWidget {
  final String text;
  final IconData iconName;
  final String selectedSection;
  final bool isTabletSize;
  final Function(String) onPressed;
  const TextButtons({super.key, required this.text,required this.iconName, required this.selectedSection,required this.isTabletSize, required this.onPressed});

  @override
  State<TextButtons> createState() => _TextButtonsState();
}

class _TextButtonsState extends State<TextButtons> {
  bool isHovered=false;
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.selectedSection == widget.text;
    return MouseRegion(
      onEnter: (_){
        setState(() {
          isHovered=true;
        });
      },
      onExit: (_){
        setState(() {
          isHovered=false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextButton(
            style: ButtonStyle(
              backgroundColor:widget.selectedSection==widget.text?
                  MaterialStateProperty.all<Color>(Colors.green):  isHovered ? MaterialStateProperty.all<Color>(Colors.white)
                                                                              : null,
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  // side: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            onPressed: () {
              print(widget.text);
              widget.onPressed(widget.text);
            },

            child: (widget.isTabletSize==true)?
                      Icon(widget.iconName,color: isSelected?Colors.white:isHovered?Colors.green:Colors.white,size: 16):
                      Text(widget.text,style:tButtonTextStyle.copyWith(color: isSelected?null:isHovered?Colors.green:Colors.white,fontSize: 14))

        ),
      ),
    );
  }
}
