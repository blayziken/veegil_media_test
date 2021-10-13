import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/utils/margins.dart';
import 'package:veegil_media_test/widgets/transaction_tile.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home-view';

  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
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
                    Text('Hi, Welcome!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    Spacer(),
                    InkWell(
                      child: Row(
                        children: [
                          Text('Deposit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
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
                  height: media.height * 0.175, //160,
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
                        style: TextStyle(fontSize: 20, color: Colors.white70, fontWeight: FontWeight.w400),
                      ),
                      yMargin5,
                      Text(
                        'N ${accountBalance}',
                        style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                      // yMargin20,
                    ],
                  ),
                ),
              ),
              yMargin20,
              Center(
                child: Text(
                  'Transactions',
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
                ),
              ),
              Divider(thickness: 1),
              // yMargin5,
              Expanded(
                child: Container(
                  // height: 300,
                  // color: Colors.teal,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final transactionsData = Provider.of<Transactions>(context).transactions;
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
