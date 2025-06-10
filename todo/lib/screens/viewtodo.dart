import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/appbarcommon.dart';
import 'package:todo/constants.dart';
import '../components/completed_delete_button.dart';
import '../providers/fetchtodo/fetch_todo_provider.dart';
import 'api_requests/deleteUserTodo.dart';
import 'api_requests/update_todo_id.dart';

class ViewTodo extends StatelessWidget {
  final String id;
  final String userId;
  final String category;
  final String title;
  final String description;
  final String notes;
  final String status;
  const ViewTodo({super.key, required this.id, required this.userId, required this.category, required this.title, required this.description, required this.notes, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyWhiteBGColor,
      appBar: AppbarCommon(appbarTitle: 'Todo Task'),
      body: Padding(
          padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Category: ',
                    style: kCategoryStyle.copyWith(color: kPurpleColor),
                  ),
                  TextSpan(
                    text:
                    category,
                    style: kAnswerStyle,
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Title: ',
                    style: kCategoryStyle.copyWith(color: kPurpleColor),
                  ),
                  TextSpan(
                    text:
                    title,
                    style: kAnswerStyle,
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Description: ',
                    style: kCategoryStyle.copyWith(color: kPurpleColor),
                  ),
                  TextSpan(
                    text:
                    description,
                    style: kAnswerStyle,
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Notes: ',
                    style: kCategoryStyle.copyWith(color: kPurpleColor),
                  ),
                  TextSpan(
                    text: notes,
                    style: kAnswerStyle,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            status=="completed"?
                Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async{
                          print("Deleting $id $title");
                          bool result=await DeleteUserTodo.deleteUserTodoById(id, context);
                          if (result==true){
                            Navigator.pop(context);
                            Provider.of<FetchTodoProvider>(context,listen: false).loadUserTodos(userId);
                          }
                          else{
                            print("Nothing has deleted. false has been returned from deleteUserTodoById");
                          }
                        },
                        child: CompletedDeleteButton(
                            containerColor:kDeleteColor,
                            iconName: Icons.clear_all_rounded,
                            text: "Remove"
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                          onTap: () async {
                            bool result=await UpdateTodoId.updateTodoByUserIdTodoId(userId, id,"pending", context);
                            if(result==true){
                              Provider.of<FetchTodoProvider>(context,listen: false).loadUserTodos(userId);
                              Navigator.pop(context);

                            }
                          },
                          child: CompletedDeleteButton(
                              containerColor: kCompleteColor,
                              iconName: Icons.clear_all_rounded,
                              text: "Move To Pending"
                          )
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                )    :
                Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async{
                          print("Deleting $id $title");
                          bool result=await DeleteUserTodo.deleteUserTodoById(id, context);
                          if (result==true){
                            Provider.of<FetchTodoProvider>(context,listen: false).loadUserTodos(userId);
                            Navigator.pop(context);
                          }
                          else{
                            print("Nothing has deleted. false has been returned from deleteUserTodoById");
                          }
                        },
                        child: CompletedDeleteButton(
                            containerColor:kDeleteColor,
                            iconName: Icons.clear_all_rounded,
                            text: "Delete"
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          bool result=await UpdateTodoId.updateTodoByUserIdTodoId(userId, id,"completed", context);
                          if(result==true){
                            Provider.of<FetchTodoProvider>(context,listen: false).loadUserTodos(userId);
                            Navigator.pop(context);
                          }
                        },
                        child: CompletedDeleteButton(
                            containerColor: kCompleteColor,
                            iconName: Icons.checklist,
                            text: "Mark As Done"
                        ),
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                )

          ],
        ),
      ),

    );
  }
}
