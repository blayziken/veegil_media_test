import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/Screens/transactions/transaction_detail.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/utils/margins.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

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
      padding: EdgeInsets.only(bottom: media.height * 0.010),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.date, //'Date',
            style: TextStyle(
                fontSize: media.height * 0.019, fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: EdgeInsets.all(media.height * 0.005),
            child: InkWell(
              child: Container(
                height: media.height * 0.080,
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
                  padding: EdgeInsets.only(
                      top: media.height * 0.005,
                      bottom: media.height * 0.005,
                      left: media.height * 0.010,
                      right: media.height * 0.010),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: media.height * 0.018,
                        child: Icon(Icons.assignment),
                      ),
                      SizedBox(width: media.height * 0.020),
                      // xMargin20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title, //transaction.phoneNumber, // 'Phone Numberr',
                            style: TextStyle(
                                fontSize: media.height * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: media.height * 0.005),

                          // yMargin5,
                          Text(
                            transaction.time, // Time
                            style: TextStyle(
                                fontSize: media.height * 0.018,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        amount, //transaction.amount, //'51.00',
                        style: TextStyle(
                          fontSize: media.height * 0.026,
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
