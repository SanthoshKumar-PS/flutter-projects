import 'package:attendance_tracking/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class SwipeGesture extends StatefulWidget {
  const SwipeGesture({super.key});

  @override
  State<SwipeGesture> createState() => _SwipeGestureState();
}

class _SwipeGestureState extends State<SwipeGesture> {
  double iconPosition=10;
  bool isCompleted=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.decelerate,
                      height: isCompleted?50:60,
                      width: isCompleted?50:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: isCompleted?Colors.green:kBluePasswordVerification,
                          borderRadius: BorderRadius.all(Radius.circular(isCompleted?100:10))
                      ),
                      child: Center(child: isCompleted?
                      Icon(Iconsax.copy_success):Text('Swipe to release',
                        style: TextStyle(color: Colors.black.withOpacity(1-(iconPosition/MediaQuery.of(context).size.width))),
                      ),
                      ),
                    ),
                    Positioned(
                        left: iconPosition,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (option){
                            setState(() {
                              iconPosition+=option.delta.dx;
                              print('Icon Position Update  $iconPosition');
                            });
                          },
                          onHorizontalDragEnd: (option){
                            // print("Icon Position ${iconPosition} Width ${MediaQuery.of(context).size.width*0.65} ");
                            if(iconPosition>(MediaQuery.of(context).size.width*0.65)){
                              setState(() {
                                isCompleted=true;
                                Future.delayed(Duration(seconds: 1), (){
                                  setState(() {
                                    isCompleted=false;
                                    iconPosition=10;
                                  });
                                });
                              });
                            }
                            if(iconPosition<(MediaQuery.of(context).size.width*0.65)){
                              setState(() {
                                iconPosition=10;
                              });
                            }
                          },
                          child: Container(
                            // color: Colors.red,
                              height:60,
                              child: Center(
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                  curve: Curves.linear,
                                  height: isCompleted?10:45,
                                  width: isCompleted?10:45,
                                  decoration: BoxDecoration(
                                    color:kBackgroundColor,
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                      child: Icon(Icons.arrow_forward,size: isCompleted?5:25,color:kBluePasswordVerification,)
                                  )
                              ),
                          ),
                        ),
                    )
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
