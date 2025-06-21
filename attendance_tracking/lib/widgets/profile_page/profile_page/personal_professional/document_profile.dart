import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DocumentProfile extends StatelessWidget {
  const DocumentProfile({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 7,horizontal: 0),
          leading: CircleAvatar(
            backgroundColor: Color(0XFFF6F7F7),
            child: Icon(
              Iconsax.document_text_1_copy,
              size: 15,
              color: Colors.black,
              weight: 700,
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'AfacadFlux',
                fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Iconsax.document_download_copy,
            size: 15,
            weight: 700,
          ),
        ),
        Divider(
          thickness: 1,
          color: Color(0XFFF6F7F7),
          height: 0,
        )
      ],
    );
  }
}
