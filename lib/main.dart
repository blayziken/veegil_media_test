import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Home/views/payments/send_money.dart';
import 'Screens/deposit.dart';
import 'Screens/success.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'Screens/Home/home.dart';
import 'model/transaction_provider.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Transactions(),
      child: MaterialApp(
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
          Success.routeName: (context) => Success(),
          Deposit.routeName: (context) => Deposit(),
        },
      ),
    );
  }
}

// - Signup                           DONE
// - Login                            DONE
// - Deposit                          DONE
// - Send Out Money (Transfer)         DONE

// - Show Deposit History
// - Show Withdrawal History
// - Show List of transactions
