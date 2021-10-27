import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/Screens/Home/views/more/users.dart';
import 'Screens/Home/views/payments/transfer.dart';
import 'Screens/deposit.dart';
import 'Screens/success.dart';
import 'Screens/Home/views/payments/withdraw.dart';
import 'Screens/transactions/deposit_history.dart';
import 'Screens/transactions/withdrawal_history.dart';
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
        title: 'Veegil Media App',
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
          Transfer.routeName: (context) => Transfer(),
          Deposit.routeName: (context) => Deposit(),
          Withdraw.routeName: (context) => Withdraw(),

          Success.routeName: (context) => Success(),

          // Transaction Histories
          DepositHistory.routeName: (context) => DepositHistory(),
          WithdrawalHistory.routeName: (context) => WithdrawalHistory(),

          Users.routeName: (context) => Users(),
        },
      ),
    );
  }
}
