import 'package:attendance_tracking/widgets/apply_leave/reusable_widgets/bottom_continue_button.dart';
import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:attendance_tracking/widgets/login_register/reusable_card/input_decoration_constants.dart';
import 'package:attendance_tracking/widgets/login_register/login_page.dart';
import 'package:attendance_tracking/widgets/login_register/reusable_card/password_container.dart';
import 'package:get/get.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool checkSecurity = true;
  bool isChecked = false;
  bool confirmCheckSecurity = true;
  bool isNameValid = false;

  String? validateFirstName(String? value) {
    {
      if (value == null || value.length < 6) {
        setState(() => isNameValid = false);
        return 'Please enter the valid name';
      }
      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
        setState(() => isNameValid = false);
        return 'Only alphabets allowed';
      }
      setState(() => isNameValid = true);
      return null;
    }
  }

  String? validateLastName(String? value) {
    {
      if (value == null || value.length < 6) {
        return 'Please enter the valid name';
      }
      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
        return 'Only alphabets allowed';
      }
    }
    return null;
  }

  String? validateEmailAddress(String? value) {
    {
      if (value == null || !value.contains('@gmail.com')) {
        return 'Please enter the valid name';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        body: Scrollbar(
          child: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: SizedBox(
                        height: 110,
                        width: 110,
                        child: Image.asset('images/starting_images/blue_logo.avif',
                            fit: BoxFit.cover),
                      ),
                    ),
                    Text(
                      'Register Account',
                      style: kregisteraccountconstant.copyWith(fontSize: 25),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "to",
                            style:
                                kregisteraccountconstant.copyWith(fontSize: 25),
                          ),
                          TextSpan(
                            text: " TimelyTrack",
                            style: kregisteraccountconstant
                                .copyWith(color: Color(0xFF3085FE))
                                .copyWith(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Hello there,register to continue',
                        style: kregisteraccountconstant.copyWith(
                            color: Color(0xFFB7B9BE), fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // First Name
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: customInputDecoration(
                                  'First Name', 'Enter First Name'),
                              validator: validateFirstName,
                            ),
                          ),

                          //Last Name
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: customInputDecoration(
                                  'Last Name', 'Enter Last Name'),
                              validator: validateLastName,
                            ),
                          ),

                          //email address
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: TextFormField(
                              controller: _emailAddressController,
                              decoration: customInputDecoration(
                                  'Email Address', 'Enter Email address'),
                              validator: validateEmailAddress,
                            ),
                          ),

                          // password
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: buildPasswordField(
                                label: 'Password',
                                hint: 'Enter Password',
                                obscureText: checkSecurity,
                                onPressed: () {
                                  setState(() {
                                    checkSecurity = !checkSecurity;
                                  });
                                },
                                controller: _passwordController,
                                validate: (String? value) {
                                  {
                                    if (value == null || value.isEmpty) {
                                      return 'Password cannot be empty';
                                    } else if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    } else if (!RegExp(r'[A-Z]')
                                        .hasMatch(value)) {
                                      return 'Must contain at least one uppercase letter';
                                    } else if (!RegExp(r'[a-z]')
                                        .hasMatch(value)) {
                                      return 'Must contain at least one lowercase letter';
                                    } else if (!RegExp(
                                            r'[!@#$%^&*(),.?":{}|<>]')
                                        .hasMatch(value)) {
                                      return 'Must contain at least one special character';
                                    } else if (value.contains(' ')) {
                                      return 'Spaces are not allowed';
                                    }
                                    return null;
                                  }
                                }),
                          ),

                          //confirm password
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: buildPasswordField(
                                label: 'Confirm Password',
                                hint: 'Enter Confirm Password',
                                obscureText: confirmCheckSecurity,
                                onPressed: () {
                                  setState(() {
                                    confirmCheckSecurity =
                                        !confirmCheckSecurity;
                                  });
                                },
                                controller: _confirmPasswordController,
                                validate: (String? value) {
                                  {
                                    if (_confirmPasswordController
                                        .text.isEmpty) {
                                      return "Password cannot be empty";
                                    }
                                    if (_passwordController.text !=
                                        _confirmPasswordController.text) {
                                      return "Password does not match";
                                    }

                                    return null;
                                  }
                                }),
                          ),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                    value: isChecked,
                                    activeColor: Colors.blue,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    }),
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(fontSize: 12),
                                      children: [
                                        TextSpan(
                                            text: 'I agree to the',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        TextSpan(
                                          text:
                                              ' Terms & Conditions & Privacy Policy set out by this site',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        TextSpan(
                                          text: ' set out by this site',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () {
                             {
                               if (_formKey.currentState!.validate()){
                                 Get.toNamed('/bottomnavigation');
                               }
                               else{

                               }
                             }
                            },
                            child: BottomContinueButton(text: 'Register'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'or continue with social account',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 7,),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              'images/starting_images/google_logo.png',
                            ),
                          ),
                          //FaIcon(FontAwesomeIcons.google),
                          SizedBox(
                            width: 5,
                          ),
                          Center(
                            child: Text(
                              'Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/loginpage');
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              overlayColor: Colors.transparent),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
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
