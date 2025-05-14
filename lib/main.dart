import 'package:flutter/material.dart';
import 'package:todo_list/screens/homepage.dart';
// import 'package:todo_list/themes/dark_theme.dart';
// import 'package:todo_list/themes/light_theme.dart';
final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LIST TUGAS ',
      
      home: Home(),
      
    );
  }
}


