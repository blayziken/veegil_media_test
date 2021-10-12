import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/widgets/transaction_tile.dart';

class WithdrawalHistory extends StatelessWidget {
  static const routeName = '/withdrawal-history';

  const WithdrawalHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionsData = Provider.of<Transactions>(context, listen: false).withdrawTransactions;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          "Withdraw Transaction History",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                // height: 300,,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ChangeNotifierProvider.value(
                      value: transactionsData[index],
                      child: TransactionTile(),
                    );
                  },
                  itemCount: transactionsData.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
