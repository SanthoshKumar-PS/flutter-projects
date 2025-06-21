import 'package:flutter/material.dart';
import 'DoubleTextScrollClass.dart';
import 'DoubleScrollContainer.dart';
import 'UserData.dart';

//Images and name for food long List 2 parallel rows

class ImagesAndNameLongRow extends StatelessWidget {
  const ImagesAndNameLongRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          DoubleScrollContainer(imageName: UserData.user[index].imageName,name:UserData.user[index].name),
                          SizedBox(height: 2),
                          DoubleTextScroll(name:UserData.user[index].name)

                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          DoubleScrollContainer(imageName: UserData.user[index+7].imageName,name:UserData.user[index+7].name),
                          SizedBox(height: 2),
                          DoubleTextScroll(name:UserData.user[index+7].name)
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}

