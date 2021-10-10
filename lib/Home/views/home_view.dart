import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/utils/margins.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home';

  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List transactionList = [
    Transaction(
      amount: '',
      phoneNumber: '',
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(radius: 60, child: Icon(Icons.person, size: 20, color: Colors.grey)),
                xMargin20,
                Text('Hi, 0803322233', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                Spacer(),
                Text('Add Money', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Icon(Icons.add, size: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          yMargin30,
          Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account Balance',
                    style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.w400),
                  ),
                  yMargin20,
                  Text(
                    'N 0.00',
                    style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                  // yMargin20,
                ],
              ),
            ),
          ),
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Expanded(
                child: Row(
                  children: [
                    CircleAvatar(radius: 60, backgroundColor: Colors.orange),
                    xMargin20,
                    Column(
                      children: [
                        Text(
                          'Phone Numberr',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        yMargin5,
                        Text(
                          'Datetime',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      '51.00',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              );
            },
            itemCount: transactionList.length,
          ),
        ],
      ),
    );
  }
}

// body: Container(
// height: media.height,
// width: double.infinity,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Column(
// children: [
// CircleAvatar(
// radius: 100,
// backgroundColor: Colors.white54,
// child: Center(
// child: Icon(
// Icons.person,
// size: 40,
// color: Colors.grey,
// ),
// ),
// ),
// SizedBox(height: 20),
// Text('0803322233343', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
// ],
// ),
// const Spacer(),
// Container(
// height: 70,
// width: 120,
// decoration: BoxDecoration(
// color: Colors.purple,
// borderRadius: BorderRadius.circular(30),
// ),
// child: const Center(
// child: Text('N140'),
// ),
// ),
// ],
// ),
// const SizedBox(height: 40),
// Expanded(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// InkWell(
// child: Container(
// height: 80,
// width: 150,
// decoration: BoxDecoration(
// color: Colors.grey,
// borderRadius: BorderRadius.circular(30),
// ),
// child: const Center(
// child: Text(
// 'Send',
// style: TextStyle(
// color: Colors.black,
// fontSize: 25,
// fontWeight: FontWeight.w700,
// ),
// ),
// ),
// ),
// onTap: () {},
// ),
// InkWell(
// child: Container(
// height: 80,
// width: 150,
// decoration: BoxDecoration(
// color: Colors.purple,
// borderRadius: BorderRadius.circular(30),
// ),
// child: const Center(
// child: Text(
// 'Deposit',
// style: TextStyle(
// color: Colors.white,
// fontSize: 25,
// fontWeight: FontWeight.w700,
// ),
// ),
// ),
// ),
// onTap: () {},
// ),
// ],
// ),
// ),
// const SizedBox(height: 40),
// ],
// ),
// ),
