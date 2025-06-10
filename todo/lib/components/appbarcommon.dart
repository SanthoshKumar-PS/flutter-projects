import 'package:flutter/material.dart';

import '../constants.dart';

class AppbarCommon extends StatelessWidget implements PreferredSizeWidget{
  final String appbarTitle;
  const AppbarCommon({super.key, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      leading:IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.navigate_before_rounded, size: 40, color: Colors.black54,grade:200)),
      title: Text(appbarTitle,style: kTodoFooter.copyWith(fontSize: 20,color: kPurpleColor.withOpacity(0.8))),
      centerTitle: true,
      backgroundColor: kBackgroundColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
