import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:veegil_media_test/model/transaction.dart';

class Transactions extends ChangeNotifier {
  double _accountBalance = 0.0;

  double get accountBalance {
    return _accountBalance;
  }

  List<Transaction> _transactions = [];

  Future<void> addAccountBalance(amount) async {
    _accountBalance += _accountBalance + amount;
  }

  Future<void> deductAccountBalance(amount) async {
    _accountBalance -= _accountBalance - amount;
  }

  // Get Transactions
  List<Transaction> get transactions {
    return [..._transactions.reversed];
//    _items.sort()
  }

  // Add Transaction
  Future<void> addTransaction(Transaction transaction) async {
    try {
      final newTransaction = Transaction(
        id: transaction.phoneNumber,
        type: transaction.type,
        amount: transaction.amount,
        phoneNumber: transaction.phoneNumber,
        note: transaction.note,
        date: DateFormat('yMMMMd').format(DateTime.now()), // transaction.date,
        time: DateFormat('kk:mm:a').format(DateTime.now()), // transaction.date,
      );
      // 9 Aug 2021, 1:34 AM
      _transactions.add(newTransaction);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  // Get Length of Transaction List
  int getTransactionsListLength() {
    return _transactions.length;
  }
}

// dateTime: DateFormat('dd/MM/yyyy').format(DateTime.now()), //didn't use
//        dateTime: DateTime.now().toString(), //didn't use

// Future<void> fetchTransactions() async {
//   try {
//     final List<Transaction> loadedTransactions = [];
//
//     // loadedTransactions.add(
//     //   Transaction(
//     //     id: ,
//     //
//     //   ),
//     // );
//
//     _transactions = loadedTransactions;
//     notifyListeners();
//   } catch (error) {
//     throw (error);
//   }
// }
