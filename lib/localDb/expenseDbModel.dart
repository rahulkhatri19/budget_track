import 'dart:core';

class ExpenseDbModel {
  final int id;
  final String account;
  final String category;
  final String expenseNote;
  final String date;
  final String time;
  final String amount;
  final String currency;

  ExpenseDbModel(
      {required this.id,
      required this.account,
      required this.category,
      required this.expenseNote,
      required this.date,
      required this.time,
      required this.amount,
      required this.currency});

  factory ExpenseDbModel.fromJson(Map<String, dynamic> map) {
    return ExpenseDbModel(
      id: map['id'],
      account: map['account'],
      category: map['category'],
      expenseNote: map['expenseNote'],
      date: map['date'],
      time: map['time'],
      amount: map['amount'],
      currency: map['currency'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'account': account,
      'category': category,
      'expenseNote': expenseNote,
      'date': date,
      'time': time,
      'amount': amount,
      'currency': currency,
    };
  }
}
