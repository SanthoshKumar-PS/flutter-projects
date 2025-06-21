import 'package:flutter/material.dart';

class RowShowModal extends StatelessWidget {
  RowShowModal({required this.textContent, this.iconContent});

  final String textContent;
  final IconData? iconContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textContent,style: TextStyle(color: Colors.white,fontSize: 20),),
              Icon(iconContent,color: Colors.white,size: 22,weight: 900)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}