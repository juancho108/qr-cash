import 'dart:math';

import 'package:cashback/src/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  final db = Firestore.instance;

  Stream<QuerySnapshot> init() {
    return db.collection('transactions').snapshots();
  }

  Future<String> createData(TransactionModel transaction) async {
    DocumentReference ref = await db.collection('transactions').add({'text': '${transaction.text}', 'amount': '${transaction.amount}'});
    print(ref.documentID);
    return ref.documentID;
  }

  void readData(String id) async {
    DocumentSnapshot snapshot = await db.collection('transactions').document(id).get();
    print(snapshot.data['text']);
  }

  void updateData(DocumentSnapshot doc) async {
    await db.collection('transactions').document(doc.documentID).updateData({'todo': 'please 🤫'});
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('transactions').document(doc.documentID).delete();
  }

}

DB db = DB();