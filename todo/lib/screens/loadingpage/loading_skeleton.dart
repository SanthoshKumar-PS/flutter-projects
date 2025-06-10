import 'package:flutter/material.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white
      ),

      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.03),
                  child: Icon(Icons.person_outline_rounded,size: 25,color:Colors.black.withOpacity(0.20) ,)
              ),
              title: Container(height: 15,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),),
              subtitle: Container(margin:EdgeInsets.only(top: 10),height: 15,width: 10,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),),
              trailing: Container(height: 15,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),)

          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Container(height: 15,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),),
          ),

          Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: Container(height: 15,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),)
              ),
              SizedBox(width: 15),
              Expanded(
                child: Container(height: 15,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),)
              ),
              SizedBox(width: 10)
            ],
          )
        ],
      ),

    );
  }
}
