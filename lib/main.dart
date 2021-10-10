import 'package:flutter/material.dart';
import 'Home/views/payments/payments_view.dart';
import 'Home/views/payments/send_money.dart';
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
        primarySwatch: Colors.purple,
      ),
      home: WelcomeScreen(),
      routes: {
        Login.routeName: (context) => Login(),
        Signup.routeName: (context) => Signup(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SendMoney.routeName: (context) => SendMoney(),
      },
    );
  }
}
