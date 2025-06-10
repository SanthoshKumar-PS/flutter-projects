import 'package:flutter/material.dart';
import 'package:todo/components/emailTextField.dart';
import 'package:todo/components/login_register.dart';
import 'package:todo/components/passwordTextField.dart';
import 'package:todo/screens/registerpage/register_page.dart';
import 'package:todo/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  GlobalKey formKey=GlobalKey<FormState>();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController=TextEditingController();
  late SharedPreferences prefs;
  @override
  void initState() {
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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Column(
                  children: [
                    SizedBox(height: 20),
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
                            EmailTextField(emailController: emailController, labelText: 'Email',hintText: 'Enter your email',),
                            SizedBox(height: 15),
                            PasswordTextField(passwordController: passwordController,
                                obscureText: obscureText,
                                onToggle: onToggle
                            ),
                            SizedBox(height: 15),

                            GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();
                                LoginController.loginUser(emailController.text,passwordController.text,context);
                              },
                              child: LoginRegisterButton(inpText: 'Login'),
                            )
                          ]
                      ),
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Don't have an account ",
                        style: TextStyle(fontSize: 15,fontFamily: 'Serif',fontWeight: FontWeight.w500,color: kPurpleColor)
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      },
                      child: Text(
                          'Register',
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
