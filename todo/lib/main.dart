import 'package:flutter/material.dart';
import 'package:todo/providers/fetchtodo/fetch_todo_provider.dart';
import 'package:todo/screens/loginpage/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>FetchTodoProvider()),
    ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage()
    );
  }
}