import 'package:flutter/material.dart';

class ProfileSettingDetails extends StatelessWidget {
  const ProfileSettingDetails(
      {super.key,
       this.icon,
      required this.text,
      required this.subText1,
      required this.subText2,
        this.iconButton,
      required this.onTap});
  final Icon? icon;
  final String text;
  final String subText1;
  final String subText2;
  final IconButton? iconButton;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SizedBox(
            width: 30,
            child: Align(
              alignment: Alignment.topLeft,
              child: icon,
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
                color: Color(0xFF14171B),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'AfacadFlux'),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subText1,
                style: TextStyle(
                    color: Color(0xFF4C4E51),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'AfacadFlux'),
              ),
              Text(
                subText2,
                style: TextStyle(
                    color: Color(0xFF87898B),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'AfacadFlux'),
              ),
            ],
          ),
          onTap: onTap,
        ),
        Divider(
          thickness: 1,
          color: Color(0XFFF7F7F8),
        )
      ],
    );
  }
}
