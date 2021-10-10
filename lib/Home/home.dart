import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_media_test/Home/views/cards_view.dart';
import 'package:veegil_media_test/Home/views/home_view.dart';
import 'package:veegil_media_test/Home/views/more_view.dart';
import 'package:veegil_media_test/Home/views/payments/payments_view.dart';

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
    CardsView(),
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
          height: 70,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NavBarTab('Home', 0, Icon(Icons.home)),
                NavBarTab('Payments', 1, Icon(Icons.send_outlined)),
                NavBarTab('Cards', 2, Icon(Icons.credit_card_outlined)),
                NavBarTab('More', 3, Icon(Icons.more_vert_outlined)),

                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     IconButton(
                //       padding: EdgeInsets.all(0.0),
                //       icon: Icon(Icons.send_outlined),
                //       color: currentState == 1 ? Colors.black : Colors.grey,
                //       onPressed: () {
                //         setState(() {
                //           currentState = 1;
                //         });
                //       },
                //       iconSize: 40,
                //     ),
                //     Text(
                //       'Payments',
                //       style: TextStyle(
                //         color: currentState == 1 ? Colors.black : Colors.grey,
                //         fontSize: 15,
                //         fontWeight: currentState == 1 ? FontWeight.w900 : FontWeight.w700,
                //       ),
                //     ),
                //   ],
                // ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     IconButton(
                //       padding: EdgeInsets.all(0.0),
                //       icon: Icon(Icons.credit_card_outlined),
                //       color: currentState == 2 ? Colors.black : Colors.grey,
                //       onPressed: () {
                //         setState(() {
                //           currentState = 2;
                //         });
                //       },
                //       iconSize: 40,
                //     ),
                //     Text(
                //       'Cards',
                //       style: TextStyle(
                //         color: currentState == 2 ? Colors.black : Colors.grey,
                //         fontSize: 15,
                //         fontWeight: currentState == 2 ? FontWeight.w900 : FontWeight.w700,
                //       ),
                //     ),
                //   ],
                // ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     IconButton(
                //       padding: EdgeInsets.all(0.0),
                //       icon: Icon(Icons.more_vert_outlined),
                //       color: currentState == 3 ? Colors.black : Colors.grey,
                //       onPressed: () {
                //         setState(() {
                //           currentState = 3;
                //         });
                //       },
                //       iconSize: 40,
                //     ),
                //     Text(
                //       'More',
                //       style: TextStyle(
                //         color: currentState == 3 ? Colors.black : Colors.grey,
                //         fontSize: 15,
                //         fontWeight: currentState == 3 ? FontWeight.w900 : FontWeight.w700,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
      body: widgets[currentState],
    );
  }

  Column NavBarTab(String title, int number, Icon icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.all(0.0),
          icon: icon,
          color: currentState == number ? Colors.black : Colors.grey,
          onPressed: () {
            setState(() {
              currentState = number;
            });
          },
          iconSize: 40,
        ),
        Text(
          title,
          style: TextStyle(
            color: currentState == number ? Colors.black : Colors.grey,
            fontSize: 15,
            fontWeight: currentState == number ? FontWeight.w900 : FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
