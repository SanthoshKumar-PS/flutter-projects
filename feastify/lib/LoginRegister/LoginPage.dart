import 'package:flutter/material.dart';
import 'PasswordField.dart';
import 'TextField.dart';
import 'logoanimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> with SingleTickerProviderStateMixin{
  final firebaseAunthen=FirebaseAuth.instance;
  late AnimationController controller;
  late Animation<double> animation;
  final formkey=GlobalKey<FormState>();
  TextEditingController emailtextController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    controller.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    FocusScope.of(context).unfocus();
  }
  Future<User?> loginUserEmailPassword(String email,String password) async{
    try{
      UserCredential userCredential=await firebaseAunthen.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredential.user);
      return userCredential.user;
    }
    catch(e){
      print(e);
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LogoAnimation(animation: animation),
                            TextFieldEmail(emailtextController: emailtextController),
                            SizedBox(height: 25,),
                            PasswordField(controller:passwordController,label: "Enter your email",),
                            SizedBox(height: 25,),
                            ElevatedButton(
                                onPressed: ()async{
                                  if(formkey.currentState!.validate()){
                                    print(emailtextController.text);
                                    FocusScope.of(context).unfocus();
                                    Navigator.pushNamed(context, '/');
                                    print(await loginUserEmailPassword(emailtextController.text, passwordController.text));
                                  }
                                  FocusScope.of(context).unfocus();

                                },
                                child: Container(
                                    height: 50,
                                    width: 120,
                                    child: Center(child: Text("Login"))
                                )
                            ),
                            SizedBox(height: 25,),
                          ],
                        ),
                      ),
                  ),
            ),
          )
          ));
  }
}

