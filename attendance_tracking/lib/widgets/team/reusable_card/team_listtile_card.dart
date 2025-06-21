import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';

class TeamListTileCard extends StatelessWidget {
  const TeamListTileCard({
    super.key,
    required this.imageurl,
    required this.text,
    required this.subtext,
    required this.onTap
  });

  final String text;
  final String subtext;
  final String imageurl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          leading: CircleAvatar(radius: 23, backgroundImage: NetworkImage(imageurl)),
          title: Text(
            text,
            style: TextStyle(
                color: kBlack, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            subtext,
            style: TextStyle(
                color:kLightGrey, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          trailing: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ),
        const Divider(
          thickness: 1,
          color: kDividerGrey,
          height: 5,
        ),
      ],
    );
  }
}
