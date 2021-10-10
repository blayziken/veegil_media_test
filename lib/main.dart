import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'Home/home.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
      routes: {
        Login.routeName: (context) => const Login(),
        Signup.routeName: (context) => const Signup(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
