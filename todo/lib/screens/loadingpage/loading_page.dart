import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:todo/screens/loadingpage/loading_tabbar.dart';
import '../../constants.dart';
import 'loading_skeleton.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyWhiteBGColor,
      body: SafeArea(
        child: Center(
          child: Shimmer(
            color: kBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Card(
                        color: kBackgroundColor,
                        child: ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.03),
                                child: Icon(Icons.person_outline_rounded,size: 25,color:Colors.black.withOpacity(0.20) ,)
                            ),
                            title: Container(height: 20,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),),
                            subtitle: Container(margin:EdgeInsets.only(top: 10),height: 20,width: 20,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),),
                            trailing: Container(height: 40,width: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black.withOpacity(0.03)),)
                  
                        ),
                      ),
                  
                      SizedBox(height: 5),
                  
                      Row(
                        children: [
                          Expanded(child: LoadingTabbar(iconName: Icons.recycling)),
                          Expanded(child: LoadingTabbar(iconName: Icons.create)),
                        ],
                      ),
                  
                      Row(
                        children: [
                          Expanded(child: LoadingTabbar(iconName: Icons.done_all,)),
                          Expanded(child: LoadingTabbar(iconName: Icons.incomplete_circle,)),
                        ],
                      ),
                  
                      SizedBox(height: 5),
                  
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                  
                      LoadingSkeleton(),
                      LoadingSkeleton(),
                    ],
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
