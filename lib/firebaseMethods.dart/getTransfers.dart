import 'package:cloud_firestore/cloud_firestore.dart';

class GetTransfers {
  Future getTransfers() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('Transfers')
        .getDocuments();
    return qn.documents;
  }
}