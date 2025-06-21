import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance_tracking/widgets/profile_page/options_profile/privacy_policy.dart';
import 'package:attendance_tracking/widgets/profile_page/options_profile/settings.dart';
import 'package:attendance_tracking/widgets/profile_page/options_profile/terms_conditions.dart';
import 'profile_page/personal_professional/profile_list_tile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:get/get.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 47.5,
                    backgroundImage: NetworkImage("https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          color: Color(0xFF1E88E5),
                          //shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Michael Mitc',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20,fontFamily: 'AfacadFlux'),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Lead UI/UX Designer',
              style:
                  TextStyle(fontSize: 17, color: Color(0xFF2E3134),fontFamily: 'AfacadFlux'),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                    color: kBluePasswordVerification,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Center(
                  child: Text('Edit Profile',style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'PoppinsLight',
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(
                children: [
                  profileListTile(
                    text: "My Profile",
                    icon: Icon(Iconsax.profile_tick),
                    onTap: () {
                      Get.toNamed('/personalinformation');
                    },
                  ),
                  Divider(
                    color: Color(0xFFF7F7F8),
                  ),
                  profileListTile(
                    text: "Settings",
                    icon: Icon(Iconsax.setting),
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                  ),
                  Divider(
                    color: Color(0xFFF7F7F8),
                  ),
                  profileListTile(
                    text: "Terms & Conditions",
                    icon: Icon(Iconsax.paperclip),
                    onTap: () {
                      Get.toNamed('/termsandconditions');
                    },
                  ),
                  Divider(
                    color: Color(0xFFF7F7F8),
                  ),
                  profileListTile(
                    text: "Privacy Policy",
                    icon: Icon(Iconsax.personalcard),
                    onTap: () {
                      Get.toNamed('/privacypolicy');
                    },
                  ),
                  Divider(
                    color: Color(0xFFF7F7F8),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.offAllNamed('/login');
                    },
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF7F7F8),
                        ),
                        child: Icon(
                          Iconsax.logout,
                          color: Colors.red,
                        ),
                      ),
                      title: Text(
                        'Log out',
                        style: GoogleFonts.anekLatin(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
