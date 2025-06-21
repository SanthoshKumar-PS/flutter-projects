import 'package:attendance_tracking/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:attendance_tracking/widgets/profile_page/profile_settings/change_password.dart';
import 'package:attendance_tracking/widgets/profile_page/reusable_widgets/settings/profile_setting_details.dart';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({super.key});

  @override
  State<SettingsProfile> createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 18,
            weight: 700,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Notification',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: 19,
              fontFamily: 'AfacadFlux'),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileSettingDetails(
                icon: Icon(
                  Iconsax.profile_circle,
                  color: Colors.blue,
                ),
                text: 'You update your profile picture',
                subText1: 'You just update your profile picture',
                subText2: 'Just Now',
                onTap: () {},
              ),
              ProfileSettingDetails(
                icon: Icon(
                  Iconsax.lock,
                  color: Colors.blue,
                ),
                text: 'Password Changed',
                subText1: 'You have changed the password successfully',
                subText2: 'April 12, 2025 at 22:22Pm',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChangePassword();
                      },
                    ),
                  );
                },
              ),
              ProfileSettingDetails(
                icon: Icon(
                  Iconsax.profile_circle,
                  color: Colors.blue,
                ),
                text: 'Mark Alen Applied for Leave ',
                subText1: 'Please accept my leave request.',
                subText2: 'February 23,2022 at 21:22 Pm',
                onTap: () {},
              ),
              ProfileSettingDetails(
                icon: Icon(
                  Iconsax.profile_circle,
                  color: Colors.blue,
                ),
                text: 'You update your profile picture',
                subText1: 'You just update your profile picture',
                subText2: 'Just Now',
                onTap: () {},
              ),
              ProfileSettingDetails(
                icon: Icon(
                  Iconsax.lock,
                  color: Colors.blue,
                ),
                text: 'Password Changed',
                subText1: 'You have changed the password successfully',
                subText2: 'April 12, 2025 at 22:22Pm',
                onTap: () {},
              ),
              ProfileSettingDetails(
                icon: Icon(
                  Iconsax.user,
                  color: Colors.blue,
                ),
                text: 'Account Details ',
                subText1: 'You have updated the account details.',
                subText2: 'February 23,2022 at 21:22 Pm',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
