import 'package:flutter/material.dart';
import 'package:veegil_media_test/model/transaction.dart';

class Transactions extends ChangeNotifier {
  List<Transaction> _transactions = [];

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
        date: transaction.date,
        amount: transaction.amount,
        phoneNumber: transaction.phoneNumber,
      );
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
