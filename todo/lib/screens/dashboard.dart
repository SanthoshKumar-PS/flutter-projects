import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/components/all_completed_pending.dart';
import 'package:todo/components/sidebardrawer.dart';
import 'package:todo/components/tab_bar_options.dart';
import 'package:todo/components/todo_cards.dart';
import 'package:todo/constants.dart';
import 'package:todo/screens/createtodo/create_todo.dart';
import 'package:todo/providers/fetchtodo/fetch_todo_provider.dart';
import 'package:todo/screens/loadingpage/loading_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> scaffoldState=GlobalKey<ScaffoldState>();
  List<dynamic> todosList=[];
  int todosListLength=0;
  int currentStatusValue=0; //0 for all,1 for completed, 2 for pending
  late SharedPreferences prefs;
  late String userId;
  String userName="User";

  @override
  void initState() {
    super.initState();
    initializePrefs();
    scaffoldState.currentState?.openEndDrawer(); ////This needs to be removed testing purpose
  }

  Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    final storedUserId = prefs.getString('userId');
    var storedUserName = prefs.getString('userName');
    if (storedUserName!=null){
      storedUserName=storedUserName[0].toUpperCase()+storedUserName.substring(1).toLowerCase();
    }

    setState(() {
      userId = storedUserId!;
      userName = storedUserName ?? 'User';
    });
    if(userId.isNotEmpty){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<FetchTodoProvider>(context, listen: false).loadUserTodos(userId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<FetchTodoProvider>(context).isLoading == true){
      return LoadingPage();

    }
    return Scaffold(
      key: scaffoldState,
      endDrawer: SideBarDrawer(scaffoldState: scaffoldState),
      backgroundColor: kLightGreyWhiteBGColor,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    color: kBackgroundColor,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/images/profile.jpg'),
                      ),
                      title: Text('Welcome to Taskly,',style: TextStyle(fontFamily: 'Serif',fontWeight: FontWeight.bold,fontSize: 18,color: kPurpleColor),),
                      subtitle: Text(userName, style: TextStyle(fontFamily: 'Serif',fontWeight: FontWeight.bold,fontSize: 18,color: kPurpleColor),),
                      trailing: Container(
                          padding: EdgeInsets.all(10),
                          //height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kBackgroundColor, width: 1),
                          ),
                          child: GestureDetector(
                            onTap: (){
                              scaffoldState.currentState?.openEndDrawer();
                            },
                              child: Icon(Icons.menu,size:28)
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 3),

                  Row(
                    children: [
                      Expanded(child: TabBarOptions(iconName: Icons.recycling, tabText: 'All',tabCount: Provider.of<FetchTodoProvider>(context).todoCount.toString(),tabColor: Color(0xFFF4EA7A),)),
                      Expanded(
                        child: GestureDetector(
                          onTap: ()async {
                            bool result=await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTodo()));
                            if (result==true){
                            Provider.of<FetchTodoProvider>(context, listen: false).loadUserTodos(userId);
                            }

                          },
                            child: TabBarOptions(iconName: Icons.create, tabText: 'Create Task', tabCount: '',tabColor: Color(0xFFB2C2FB))
                        ),
                      ),

                    ],
                  ),

                  Row(
                    children: [
                      Expanded(child: TabBarOptions(iconName: Icons.done_all, tabText: 'Completed', tabCount: Provider.of<FetchTodoProvider>(context).todoCompletedCount.toString() ,tabColor: Color(0xFF84EAB3))),
                      Expanded(child: TabBarOptions(iconName: Icons.incomplete_circle, tabText: 'Pending',tabCount: Provider.of<FetchTodoProvider>(context).todoPendingCount.toString() ,tabColor: Color(0xFFFFC0F5),))
                    ],
                  ),

                  SizedBox(height: 5),

                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFBFBFB),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Row(
                      children: [
                        AllCompletedPending(
                            onTap: (index){
                              setState(() {
                                currentStatusValue=index;
                              });
                            },
                            statusIndex: 0,
                            currentSelectedIndex: currentStatusValue,
                            statusString: 'All'
                        ),
                        AllCompletedPending(
                            onTap: (index){
                              setState(() {
                                currentStatusValue=index;
                              });
                            },
                            statusIndex: 1,
                            currentSelectedIndex: currentStatusValue,
                            statusString: 'Completed'
                        ),
                        AllCompletedPending(
                            onTap: (index){
                              setState(() {
                                currentStatusValue=index;
                              });
                            },
                            statusIndex: 2,
                            currentSelectedIndex: currentStatusValue,
                            statusString: 'Pending'
                        ),
                      ],
                    ),
                  ),

                  Consumer<FetchTodoProvider>(
                    builder: (context,provider,child){
                      if(provider.todoCount==0){
                        return Image(
                          height: MediaQuery.of(context).size.height*0.4,
                          image: AssetImage('assets/images/nodatafound.png'),
                          alignment: Alignment.center,
                        );
                      }
                      if(provider.todoCompletedCount==0 && currentStatusValue==1){
                        return Image(
                          height: MediaQuery.of(context).size.height*0.4,
                          image: AssetImage('assets/images/nodatafound.png'),
                          alignment: Alignment.center,
                        );
                      }
                      if(provider.todoPendingCount==0 && currentStatusValue==2){
                        return Image(
                          height: MediaQuery.of(context).size.height*0.4,
                          image: AssetImage('assets/images/nodatafound.png'),
                          alignment: Alignment.center,
                        );
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.todoList.length,
                          itemBuilder: (context,index){
                            final todo=provider.todoList[provider.todoCount - index-1];
                            if(currentStatusValue==0){
                              return TodoCards(
                                  id: todo.id,
                                  userId: todo.userId,
                                  category: todo.category,
                                  title: todo.title,
                                  description: todo.description,
                                  notes: todo.notes,
                                  status: todo.status
                              );
                            }
                            else if(currentStatusValue==1 && todo.status=="completed"){
                              return TodoCards(
                                  id: todo.id,
                                  userId: todo.userId,
                                  category: todo.category,
                                  title: todo.title,
                                  description: todo.description,
                                  notes: todo.notes,
                                  status: todo.status
                              );
                            }
                            else if(currentStatusValue==2 && todo.status=="pending"){
                              return TodoCards(
                                  id: todo.id,
                                  userId: todo.userId,
                                  category: todo.category,
                                  title: todo.title,
                                  description: todo.description,
                                  notes: todo.notes,
                                  status: todo.status
                              );
                            }

                            return const SizedBox.shrink();



                          });
                    }
                  )






                ],
              ),
            ),
          )
      )
    );
  }
}
