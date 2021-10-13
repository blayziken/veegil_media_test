import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/Screens/transactions/transaction_detail.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/utils/margins.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transaction = Provider.of<Transaction>(context);
    String title = '';
    String amount = '';
    Color color = Colors.black;

    if (transaction.type == "Deposit") {
      title = "Deposit";
      amount = "+ N${transaction.amount}";
      color = Colors.green;
    } else if (transaction.type == "Withdraw") {
      title = "Withdraw";
      amount = "- N${transaction.amount}";
      color = Colors.red;
    } else if (transaction.type == "Transfer") {
      title = transaction.phoneNumber;
      amount = "- N${transaction.amount}";
      color = Colors.red;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.date, //'Date',
            style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 1,
                      offset: Offset(3, 4),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: Icon(Icons.assignment),
                      ),
                      xMargin20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title, //transaction.phoneNumber, // 'Phone Numberr',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          yMargin5,
                          Text(
                            transaction.time, // Time
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        amount, //transaction.amount, //'51.00',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: color,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionDetails(
                      date: transaction.date,
                      amount: transaction.amount,
                      // phoneNumber: ,
                      title: transaction.phoneNumber,
                      color: color,
                      description: transaction.type,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
