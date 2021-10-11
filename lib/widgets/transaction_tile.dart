import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/utils/margins.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transaction = Provider.of<Transaction>(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.date, //'Date',
            style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
          ),
          Container(
            color: Colors.deepOrange,
            height: 70,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 20, backgroundColor: Colors.orange),
                  xMargin20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        transaction.phoneNumber, // 'Phone Numberr',
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
                    transaction.amount, //'51.00',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
