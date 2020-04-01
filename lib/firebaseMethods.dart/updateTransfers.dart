import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateTransfers {

  final db = Firestore.instance;
   
   update(
    DocumentSnapshot doc,
    String dateOfAdminTransfer,
  ) async {
    await db.collection('Transfers').document(doc.documentID).updateData({
      'dateOfAdminTransfer': dateOfAdminTransfer,
      'isDone' : 1
    });
  }

}