import 'package:chat/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: 'login',
      routes: appRoutes,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Color.fromARGB(255, 255, 83, 4),
          secondary: Colors.blue,
        ),
      ),
    );
  }

}