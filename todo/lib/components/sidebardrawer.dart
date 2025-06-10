import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/loginpage/login_page.dart';

class SideBarDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  const SideBarDrawer({super.key, required this.scaffoldState});

  @override
  State<SideBarDrawer> createState() => _SideBarDrawerState();
}

class _SideBarDrawerState extends State<SideBarDrawer> {
  late String userName="Loading...";
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePrefernces();
  }
  void initializePrefernces() async{
    prefs= await SharedPreferences.getInstance();
    setState(() {
      userName=prefs.getString('userName')!;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 10),
                CircleAvatar(
                  minRadius: 20,
                  maxRadius: 50,
                  child: Image(image: AssetImage('assets/images/login_image.png'),fit: BoxFit.cover,),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(userName,style: kTodoHeader,),
                    Icon(Icons.verified_user_outlined,size: 20)
                  ],
                ),
              ],
            ),


            GestureDetector(
              onTap: () async{
                prefs.remove('userId');
                prefs.remove('userName');
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                widget.scaffoldState.currentState?.closeEndDrawer();

              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout,size: 20),
                      SizedBox(width: 20),
                      Text('Logout',style: kTodoHeader),
                    ],
                  ),
                  SizedBox(height: 15)
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
