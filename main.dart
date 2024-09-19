//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:provider.dart';
import 'user_provider.dart';
import 'user_list_screen.dart'; 
//import 'user_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override  // Add this annotation
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: "User List App",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: UserListScreen(),
      ),
    );
  }
}
