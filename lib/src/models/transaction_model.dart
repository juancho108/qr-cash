//import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String transactionID;
  final String text;
  final double amount;

  TransactionModel({
    this.transactionID,
    this.text,
    this.amount,
  });

  Map<String, Object> toJson() {
    return {
      'transactionID': transactionID,
      'text': text,
      'amount': amount,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) => new TransactionModel(
    transactionID: json["transactionID"],
    text: json["text"],
    amount: json["amount"],
  );


  // factory TransactionModel.fromDocument(DocumentSnapshot doc) {
  //   return TransactionModel.fromJson(doc.data);
  // }
}
