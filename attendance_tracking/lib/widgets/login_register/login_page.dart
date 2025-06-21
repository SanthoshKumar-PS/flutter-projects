import 'package:flutter/material.dart';
import 'package:attendance_tracking/widgets/login_register/Register_page.dart';
import 'package:attendance_tracking/widgets/login_register/reusable_card/input_decoration_constants.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:attendance_tracking/widgets/login_register/reusable_card/bottom_continue_button.dart';
import 'package:get/get.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool loginCheckSecurity = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
          body: 
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            ClipRRect(
                              child: SizedBox(
                                height: 110,
                                width: 110,
                                child:
                                Image.asset('images/starting_images/blue_logo.avif', fit: BoxFit.fill),
                              ),
                            ),
                            Text(
                              'Welcome Back 👋',
                              style: kregisteraccountconstant.copyWith(
                                  fontSize: 30, color: kBlack),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "to",
                                    style: kregisteraccountconstant.copyWith(fontSize: 30),
                                  ),
                                  TextSpan(
                                    text: " TimelyTrack",
                                    style: kregisteraccountconstant
                                        .copyWith(color: kBluePasswordVerification)
                                        .copyWith(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Hello there,login to continue',
                                style: kregisteraccountconstant.copyWith(
                                    color: Color(0xFFBDBDBD), fontSize: 14),
                              ),
                            ),
                            Form(
                              key: _loginFormKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 17.0),
                                    child: TextFormField(
                                      decoration: customInputDecoration(
                                          'Email Address', 'Enter Email Address'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        labelText: 'Password',
                                        labelStyle:
                                        TextStyle(color: Colors.blue, fontSize: 15),
                                        floatingLabelStyle: TextStyle(color: Colors.blue),
                                        hintText: 'Enter password',
                                        hintStyle:
                                        TextStyle(color: kGrey, fontSize: 15),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(color: Color(0xFFEEEFF0), width: 2), // Green on focus
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(color: Color(0xFFEEEFF0),width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(color: Colors.blue, width: 2), // Green on focus
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              loginCheckSecurity = !loginCheckSecurity;
                                            });
                                          },
                                          icon: Icon(loginCheckSecurity
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          color: Colors.blue,
                                        ),
                                      ),
                                      obscureText: loginCheckSecurity,
                                    ),
                                  ),
                                  SizedBox(
                                    height:10 ,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Get.toNamed('/forgotpassword');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(color: Colors.blue, fontSize: 13,fontFamily: 'Poppins'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                      onTap: (){
                                        Get.toNamed('/bottomnavigation');
                                      },
                                      child: BottomContinueButton(text: 'Login')),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 1,
                                          color: Color(0XFFF6F7F7),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Or continue with social account',
                                          style: TextStyle(color: kGrey),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          thickness: 1,
                                          color: Color(0XFFF6F7F7),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 8.0),
                                    height: 55,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0XFFEEEFF0),
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        SizedBox(
                                          height:40,
                                          child: Image(
                                          image: AssetImage('images/starting_images/microsoft.png',),
                                          fit: BoxFit.fitHeight,
                                                                                ),
                                        ),
                        ]
                                    ),
                                  ),
                    
                                ],
                              ),
                            ),
                            //alignbt
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't have an account?",
                        style: TextStyle(color: kBlack),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/registerpage');
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero,overlayColor: Colors.transparent),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        ),
    );
  }
}
