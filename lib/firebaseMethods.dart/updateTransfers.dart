import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateTransfers {

  final db = Firestore.instance;
   
   updateSarOnTransfer(
    DocumentSnapshot doc,
    int sar,
    int tSar,
  ) async {
    await db.collection('Transfers').document(doc.documentID).updateData({
      'sar': sar,
      'transferSar': FieldValue.arrayUnion([tSar])
    });
  }

}