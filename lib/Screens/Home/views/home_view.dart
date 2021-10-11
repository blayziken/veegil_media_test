import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/utils/margins.dart';
import 'package:veegil_media_test/widgets/transaction_tile.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home';

  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _spinner = false;
  var _isInit = true;

  List transactionList = [
    Transaction(
      amount: '',
      phoneNumber: '',
      // date: DateTime.now(),
    ),
    // Transaction(
    //   amount: '',
    //   phoneNumber: '',
    //   date: DateTime.now(),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    // Size media = MediaQuery.of(context).size;
    final accountBalance = Provider.of<Transactions>(context, listen: false).accountBalance;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    CircleAvatar(radius: 20, child: Icon(Icons.person, size: 25, color: Colors.white)),
                    xMargin10,
                    Text('Hi 0803322233', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    Spacer(),
                    InkWell(
                      child: Row(
                        children: [
                          Text('Add Money', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                          xMargin5,
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.purple, width: 2),
                            ),
                            child: Center(
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Icon(Icons.add, size: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.pushNamed(context, '/deposit'),
                    ),
                  ],
                ),
              ),
              yMargin30,
              Expanded(
                flex: 0,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Account Balance',
                        style: TextStyle(fontSize: 30, color: Colors.white70, fontWeight: FontWeight.w400),
                      ),
                      yMargin5,
                      Text(
                        'N ${accountBalance}',
                        style: TextStyle(fontSize: 55, color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                      // yMargin20,
                    ],
                  ),
                ),
              ),
              yMargin30,
              Expanded(
                child: Container(
                  height: 300,
                  color: Colors.teal,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final transactionsData = Provider.of<Transactions>(context).transactions;
                      // var listw = Provider.of<Transactions>(context, listen: false).transactions
                      // final transactions = transactionsData.transactions;
                      return ChangeNotifierProvider.value(
                        value: transactionsData[index],
                        child: TransactionTile(),
                      );
                    },
                    itemCount: Provider.of<Transactions>(context, listen: false).getTransactionsListLength(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 9 Aug 2021, 1:34 AM

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
