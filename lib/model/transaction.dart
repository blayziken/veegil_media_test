import 'package:flutter/material.dart';

class Transaction extends ChangeNotifier {
  String id;
  String type;
  String phoneNumber;
  String amount;
  String date;
  String note;
  String time;

  Transaction({
    this.id = "",
    this.type = "",
    this.amount = "",
    this.phoneNumber = "",
    this.date = "",
    this.time = "",
    this.note = "",
  });
}
