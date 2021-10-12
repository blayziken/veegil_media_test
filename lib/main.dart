import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Home/views/payments/send_money.dart';
import 'Screens/deposit.dart';
import 'Screens/success.dart';
import 'Screens/Home/views/payments/withdraw.dart';
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
          // Auth Routes
          Login.routeName: (context) => Login(),
          Signup.routeName: (context) => Signup(),
          HomeScreen.routeName: (context) => HomeScreen(),

          // Transfer Routes
          SendMoney.routeName: (context) => SendMoney(),
          Deposit.routeName: (context) => Deposit(),
          Withdraw.routeName: (context) => Withdraw(),

          Success.routeName: (context) => Success(),
        },
      ),
    );
  }
}

// - Signup                           DONE
// - Login                            DONE
// - Deposit                          DONE
// - Send Out Money (Transfer)         DONE
// - Show List of transactions         DONE

// - Show Deposit History
// - Show Withdrawal History
