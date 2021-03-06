import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/widgets/transaction_tile.dart';

class DepositHistory extends StatelessWidget {
  static const routeName = '/deposit-history';

  const DepositHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    final transactionsData =
        Provider.of<Transactions>(context, listen: false).depositTransactions;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          "Deposit Transaction History",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: media.height * 0.010,
            right: media.height * 0.010,
            top: media.height * 0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                // height: 300,
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
