import 'package:flutter/material.dart';
import 'PasswordField.dart';
import 'TextField.dart';
import 'logoanimation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> with SingleTickerProviderStateMixin{
  final firebaseAunthen=FirebaseAuth.instance;
  late AnimationController controller;
  late Animation<double> animation;
  final formkey=GlobalKey<FormState>();
  TextEditingController emailtextController=TextEditingController();
  TextEditingController passwordController1=TextEditingController();
  TextEditingController passwordController2=TextEditingController();
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

  Future<User?> registerUserEmailPassword(String email,String password) async{
    try{
      UserCredential userCredential=await firebaseAunthen.createUserWithEmailAndPassword(
          email: email, password: password
      );
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
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoAnimation(animation: animation,),
                      SizedBox(height: 15,),
                      TextFieldEmail(emailtextController: emailtextController),
                      SizedBox(height: 15,),
                      PasswordField(controller:passwordController1,label: "Enter Password",),
                      SizedBox(height: 15,),
                      PasswordField(controller:passwordController2,label: "Confirm Password",confirmWithController:passwordController1),
                      SizedBox(height: 15,),
                      ElevatedButton(
                          onPressed: (){
                            if(formkey.currentState!.validate()){
                              print(emailtextController.text);
                              FocusScope.of(context).unfocus();
                              Navigator.pushNamed(context, '/');
                              print(registerUserEmailPassword(emailtextController.text,passwordController1.text));
                            }
                            FocusScope.of(context).unfocus();
                          },
                          child: Container(
                            height: 50,
                              width: 120,
                              child: Center(child: Text("Register"))
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}


