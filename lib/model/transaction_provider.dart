import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:veegil_media_test/model/transaction.dart';

class Transactions extends ChangeNotifier {
  int _accountBalance = 0;
  List<Transaction> _transactions = [];
  List<Transaction> _depositTransactions = [];
  List<Transaction> _withdrawalTransactions = [];

  String get accountBalance {
    return NumberFormat("###,###", "en_US").format(_accountBalance);
  }

  // Increase Account Balance
  Future<void> addAccountBalance(int amount) async {
    _accountBalance = _accountBalance + amount;
  }

  // Decrease Account Balance
  Future<void> deductAccountBalance(int amount) async {
    _accountBalance = _accountBalance - amount;
  }

  // Get Transactions
  List<Transaction> get transactions {
    return [..._transactions.reversed];
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

      _transactions.add(newTransaction);

      if (transaction.type == "Deposit") {
        _depositTransactions.add(newTransaction);
      } else if (transaction.type == "Withdraw") {
        _withdrawalTransactions.add(newTransaction);
      }

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

  // Get Deposit Transaction List
  List<Transaction> get depositTransactions {
    return [..._depositTransactions.reversed];
  }
  //
  // // Get Length of Deposit Transaction List
  // int getDepositTransactionsListLength() {
  //   return _depositTransactions.length;
  // }

  // Get Withdraw  Transaction List
  List<Transaction> get withdrawTransactions {
    return [..._withdrawalTransactions.reversed];
  }

  // // Get Length of Withdraw Transaction List
  // int getWithdrawTransactionsListLength() {
  //   return _withdrawalTransactions.length;
  // }
}
