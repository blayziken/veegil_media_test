import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_media_test/Screens/Home/views/transactions_view.dart';
import 'package:veegil_media_test/Screens/Home/views/home_view.dart';
import 'package:veegil_media_test/Screens/Home/views/more_view.dart';
import 'package:veegil_media_test/Screens/Home/views/payments/payments_view.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentState = 0;

  List<Widget> widgets = [
    HomeView(),
    PaymentsView(),
    TransactionsView(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: media.height * 0.08, //60
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NavBarTab('Home', 0, Icons.home), //Icon(Icons.home)
                NavBarTab('Payments', 1, Icons.send_outlined),
                NavBarTab('Transactions', 2, Icons.assignment_outlined),
                NavBarTab('Profile', 3, Icons.account_circle_outlined),
              ],
            ),
          ),
        ),
      ),
      body: widgets[currentState],
    );
  }

  Column NavBarTab(String title, int number, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: Icon(
            icon,
            size: 25,
            color: currentState == number ? Colors.black : Colors.grey,
          ),
          onTap: () {
            setState(() {
              currentState = number;
            });
          },
        ),
        SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(
            color: currentState == number ? Colors.black : Colors.grey,
            fontSize: 13,
            fontWeight: currentState == number ? FontWeight.w900 : FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
