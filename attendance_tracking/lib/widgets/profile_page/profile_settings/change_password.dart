import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _passwordCheckSecurity = true;
  bool _confirmCheckSecurity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: kWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 17,
            weight: 700,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Change Password',
          style: TextStyle(
              color: kBlack, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: kGrey),
                        filled: true,
                        fillColor: kWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.green, width: 2), // Green on focus Color(0xFFEEEFF0)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kBluePasswordVerification,width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kBluePasswordVerification, width: 2), // Green on focus
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordCheckSecurity = !_passwordCheckSecurity;
                            });
                          },
                          icon: _passwordCheckSecurity
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.blue,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                      obscureText: _passwordCheckSecurity,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return 'Must contain at least one uppercase letter';
                        } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return 'Must contain at least one lowercase letter';
                        } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
                          return 'Must contain at least one special character';
                        } else if (value.contains(' ')) {
                          return 'Spaces are not allowed';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFormField(
                        controller: _confirmPassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.blue),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: kGrey),
                          filled: true,
                          fillColor: kWhite,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green, width: 2), // Green on focus Color(0xFFEEEFF0)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kBluePasswordVerification,width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kBluePasswordVerification, width: 2), // Green on focus
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _confirmCheckSecurity = !_confirmCheckSecurity;
                              });
                            },
                            icon: _confirmCheckSecurity
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.blue,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.blue,
                                  ),
                          ),
                        ),
                        obscureText: _confirmCheckSecurity,
                        validator: (value) {
                          if (_password.text.isEmpty) {
                            return 'Password Should not be null';
                          } else if (_password.text != _confirmPassword.text) {
                            return "Password doesn't match";
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 57,
                decoration: BoxDecoration(
                    color: kBluePasswordVerification,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Center(
                  child: Text('Update',style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'PoppinsLight',
                      fontWeight: FontWeight.bold
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
