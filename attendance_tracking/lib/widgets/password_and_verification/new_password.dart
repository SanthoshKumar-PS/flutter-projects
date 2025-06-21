import 'package:attendance_tracking/widgets/password_and_verification/reusable_widgets/bottom_continue_button.dart';
import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'congratulations.dart';
class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController secondPasswordController=TextEditingController();
  String? errorText;
  @override
  Widget build(BuildContext context) {
    print('Height of the device is ${MediaQuery.of(context).size.height}');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          leading: Icon(Icons.navigate_before_rounded, size: 40, color: Colors.black54,grade:200),
      backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 28,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter New Password',style:kPasswordVerification),
                          SizedBox(height: 10),
                          Text(
                              'Please enter your new password',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kVeryLightText
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              PasswordField(
                                controller: passwordController,
                                validateFun: (value){
                                  if(value==null||value.isEmpty||value.length<6){
                                    return "⚠ Enter Atleast 6 Characters";

                                  }
                                  if(!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)){
                                    return "⚠ Must contain atleast 1 special characters";
                                  }

                                  return null;
                                },
                                hintText: 'Enter new password',
                                labelText: 'Password',
                              ),
                              SizedBox(height: 15),
                              PasswordField(
                                controller: secondPasswordController,
                                validateFun: (value){
                                  if(passwordController.text!=value){
                                    return "⚠ Password does not match";
                                  }
                                },
                                hintText: 'Re-Enter new password again',
                                labelText: 'Re-Enter Password',
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.40,
                        width: double.infinity,
                        child: Image(image: AssetImage('images/PasswordValidation/mypassword.png',)),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: (){
                    FocusScope.of(context).unfocus();
                    if(formKey.currentState!.validate()){
                      print('All okay');
                    }
                    else{
                      Congratulations.showDialogBox(context); //Congratulations pop-up
                    }
                  },
                  child: BottomContinueButton(text: 'Continue')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {

  PasswordField({required this.controller,required this.validateFun,required this.hintText,required this.labelText});
  final TextEditingController controller;
  final FormFieldValidator validateFun;
  final String hintText;
  final String labelText;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          hintText: widget.hintText,
          hintStyle: kLeaveDetailsHeader,
          labelText: widget.labelText,
          labelStyle: kLeaveDetailsFooter.copyWith(fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,//"Enter your password",
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
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              isVisible=!isVisible;
            });
          },
              icon: isVisible?Icon(Icons.visibility):Icon(Icons.visibility_off))
      ),
      obscureText: isVisible,
      validator: widget.validateFun,
    );
  }
}


