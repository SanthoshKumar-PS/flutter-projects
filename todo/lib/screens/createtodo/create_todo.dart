import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/components/appbarcommon.dart';
import 'package:todo/constants.dart';
import '../../components/bottom_continue_button.dart';
import 'create_todo_controller.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController titleController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();
  final TextEditingController notesController=TextEditingController();
  String todoCategory="Personal";
  late SharedPreferences prefs;
  late String userId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePrefs();
  }
  Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId')!;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: kBackgroundColor,
          appBar: AppbarCommon(appbarTitle: 'Create New Task'),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 15),
                          DropdownButtonFormField(
                            value: todoCategory,
                              style: kDetailsHeader.copyWith(color: Colors.black),
                              decoration: buildInputDecoration("Category", "Task category"),
                              items: ["Educational","Grocery","Work-Related","Home-Related","Personal"]
                                  .map((options)=>DropdownMenuItem(
                                  value: options,
                                  child: Text(options,style:kDetailsHeader)
                              )).toList(),
                              onChanged: (value){
                                setState(() {
                                  todoCategory=value!;
                                  print(todoCategory);
                                });
                              }
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                              controller: titleController,
                              keyboardType: TextInputType.text,
                              decoration: buildInputDecoration("Title","Enter your task title"),
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "⚠ Enter Valid Title";
                                }
                                if(value.length>20){
                                  return "⚠ Title Length extends 20";
                                }
                                return null;
                              }
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: descriptionController,
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration("Description","Elaborate your task"),
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "⚠ Enter some description";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: notesController,
                            decoration: buildInputDecoration("Add Notes", "Key points to remember while doing this task"),
                            keyboardType: TextInputType.text,
                            maxLines: 4,
                            validator: (value){
                              return null;
                            },
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: (){
                            FocusScope.of(context).unfocus();
                            if(formKey.currentState!.validate()){
                              CreateTodoController.addNewTodo(
                                  userId,//"null_as_of_now_token",
                                  todoCategory,
                                  titleController.text,
                                  descriptionController.text,
                                  notesController.text,
                                  context
                              );
                            }
                            else{
                            }
                          },
                          child: BottomContinueButton(text: 'Create', buttonColor: kPurpleColor.withOpacity(0.7),)
                      ),
                    ],
                  )


                ],
              ),
            ),
          ),

        ));
  }

  InputDecoration buildInputDecoration(String labelText,String hintText) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      labelText:labelText,
      labelStyle: kTodoFooter.copyWith(fontSize: 20,color: kPurpleColor.withOpacity(0.7)),
      hintText: hintText,
      hintStyle: kDetailsHeader,
      floatingLabelBehavior: FloatingLabelBehavior.always,//"Enter your password",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.green, width: 2), // Green on focus Color(0xFFEEEFF0)
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: kPurpleColor.withOpacity(0.5),width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: kPurpleColor.withOpacity(0.5), width: 2), // Green on focus
      ),

    );
  }
}
