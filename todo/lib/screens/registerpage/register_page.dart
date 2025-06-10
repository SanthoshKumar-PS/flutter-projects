import 'package:flutter/material.dart';
import 'package:todo/components/emailTextField.dart';
import 'package:todo/components/login_register.dart';
import 'package:todo/components/passwordTextField.dart';
import 'package:todo/components/snackbar_message.dart';
import 'package:todo/screens/registerpage/register_controller.dart';
import 'package:todo/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../loginpage/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey formKey=GlobalKey<FormState>();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    preferenceInitialize();
  }

  void preferenceInitialize() async{
    prefs=await SharedPreferences.getInstance();
  }

  bool obscureText=true;

  void onToggle(){
    setState(() {
      obscureText= !obscureText;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                        'TASKLY',
                        style: TextStyle(fontSize: 33,fontWeight: FontWeight.w500,color: kPurpleColor)
                    ),
                    Text(
                        'Building Habit',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: kPurpleColor)

                    ),
                  ],
                ),
            
            
                Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            EmailTextField(emailController: emailController, labelText: 'Email',hintText: "Enter your email",),
                            SizedBox(height: 15),
                            EmailTextField(emailController: nameController, labelText: "Name", hintText:"Enter your name"),
                            SizedBox(height: 15),
                            PasswordTextField(passwordController: passwordController,
                                obscureText: obscureText,
                                onToggle: onToggle
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();
                                RegisterController.registerUser(
                                    emailController.text,
                                    nameController.text,
                                    passwordController.text, context
                                );
            
            
                              },
                              child:LoginRegisterButton(inpText: 'Register'),
                            )
                          ]
                      ),
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Already have an account ",
                        style: TextStyle(fontSize: 15,fontFamily: 'Serif',fontWeight: FontWeight.w500,color: kPurpleColor)
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                      child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18,fontFamily: 'Serif',fontWeight: FontWeight.bold,color: kPurpleColor)
                      ),
                    )
                  ],
                ),
                Image(
                  height: MediaQuery.of(context).size.height*0.4,
                  image: AssetImage('assets/images/login_image.png'),
                  alignment: Alignment.center,
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
