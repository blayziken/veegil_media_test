import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';

class DepositHistory extends StatelessWidget {
  static const routeName = '/deposit-history';

  const DepositHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          "Transaction Detail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: InkWell(
              child: Container(
                height: 50,
                width: 50,
                color: Colors.teal,
                child: Center(child: Icon(Icons.add, size: 40)),
              ),
              onTap: () {
                final transactionsList = Provider.of<Transactions>(context).transactions;
                final depositList = transactionsList.map((transaction) => transaction.type == "Deposit");

                print('----------------------');
                print(depositList);

                print('----------------------');
              },
            )),
            // Expanded(
            //   child: Container(
            //     height: 300,
            //     // color: Colors.teal,
            //     child: ListView.builder(
            //       itemBuilder: (BuildContext context, int index) {
            //         final transactionsList = Provider.of<Transactions>(context).transactions;
            //         // var listw = Provider.of<Transactions>(context, listen: false).transactions
            //
            //         // final depositList = [];
            //         // for (final transaction in transactionsList) {
            //         //   if(transaction.type == "Deposit") {
            //         //     depositList.add(transaction);
            //         //   }
            //         // }
            //
            //         final depositList = transactionsList.map((transaction) => transaction.type == "Deposit");
            //         print(depositList);
            //
            //         // final transactions = transactionsData.;
            //
            //         return ChangeNotifierProvider.value(
            //           value: transactionsData[index],
            //           child: TransactionTile(),
            //         );
            //       },
            //       itemCount: Provider.of<Transactions>(context, listen: false).getTransactionsListLength(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
