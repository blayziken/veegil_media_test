import 'package:flutter/material.dart';
import 'package:veegil_media_test/utils/margins.dart';

class Transaction {
  String phoneNumber;
  String amount;
  DateTime date;

  Transaction({this.amount = "", this.phoneNumber = "", required this.date});
}

Widget transactionItem() {
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
}
