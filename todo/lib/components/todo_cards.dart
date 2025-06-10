import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/fetchtodo/fetch_todo_provider.dart';
import 'package:todo/screens/viewtodo.dart';
import '../constants.dart';
import 'completed_delete_button.dart';
import 'completed_pending_trailing/completed_trailing.dart';
import 'completed_pending_trailing/pending_trailing.dart';
import 'package:todo/screens/api_requests/deleteUserTodo.dart';
import 'package:todo/screens/api_requests/update_todo_id.dart';
// I/flutter (25782): [{_id: 6839d6c34f4b05d84e544b53, userId: 6839d69a4f4b05d84e544b50, category: Grocery, title: Gro, description: tomsto, notes: buy 1 kg, status: pending, __v: 0}, {_id: 6839d6f64f4b05d84e544b56, userId: 6839d69a4f4b05d84e544b50, category: Home-Related, title: eating, description: buy and cooking greens, notes: cook and eat healthy foods, status: pending, __v: 0}]

class TodoCards extends StatelessWidget {
  final String id;
  final String userId;
  final String category;
  final String title;
  final String description;
  final String notes;
  final String status;
  TodoCards({super.key, required this.id, required this.userId, required this.category, required this.title, required this.description, required this.notes, required this.status});

  IconData getIconName(String category) {
    if (category == "Educational"){
      return Icons.event_note;
    }
    else if(category == "Grocery"){
      return Icons.local_grocery_store_outlined;
    }
    else if(category=="Work-Related"){
      return Icons.work_outline_outlined;
    }
    else if(category=="Home-Related"){
      return Icons.home_outlined;
    }
    else if(category=="Personal"){
      return Icons.person_outline_rounded;
    }
    else{
      return Icons.account_balance_outlined;
    }

  }
  @override
  Widget build(BuildContext context) {
    IconData iconName=getIconName(category);

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewTodo(id: id, userId: userId, category: category, title: title, description: description, notes: notes, status: status)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(top: 5,bottom: 16,left: 8,right: 8),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(2, 2), // changes position of shadow
              )
            ]),
        child: Column(
          children: [
            ListTile(
                leading: CircleAvatar(
                    backgroundColor: kPurpleColor.withOpacity(0.25),
                    child: Icon(iconName,size: 25,)
                ),
                title: Text(category,style: kCategoryStyle.copyWith(fontSize: 16)),
                subtitle: Text(title,style: kCategoryStyle.copyWith(fontSize: 18)),
                trailing: status=="completed"? CompletedTrailing() : PendingTrailing()
      
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(description,
                  // 'You can create a heading with tabs like "All | Pending | Completed" to filter your todos. '
                  //     'This is typically done using Flutter\'s TabBar and TabBarView widgets. '
                  //     'Here\'s a clean example to help you:',
                  style: TextStyle(fontSize: 15,fontFamily: 'Serif',fontWeight: FontWeight.w600), // optional: adjust font size
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis
              ),
            ),
      
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
                    )  :
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
