import 'package:cloud_firestore/cloud_firestore.dart';

class Transfer {
  final String nameSurname;
  final String email;
  final String dateOfBirth;
  final String creditCardNumber;
  final String expireDate;
  final String cc;
  final String dateOfTransfer;
  final int sarTransfered;
  final String dateOfAdminTransfer;
  final bool isDone;

  Transfer(
      {this.nameSurname,
      this.email,
      this.dateOfAdminTransfer,
      this.cc,
      this.creditCardNumber,
      this.dateOfBirth,
      this.dateOfTransfer,
      this.expireDate,
      this.isDone,
      this.sarTransfered});

  factory Transfer.fromDocument(DocumentSnapshot doc) {
    return Transfer(
        nameSurname: doc['name_and_surname'],
        email: doc['email'],
        dateOfBirth: doc['date_of_birth'],
        creditCardNumber: doc['card_number'],
        expireDate: doc['expipre_date'],
        cc: doc['cc'],
        dateOfTransfer: doc['date'],
        sarTransfered: doc['transferSar'],
        dateOfAdminTransfer: doc['dateOfAdminTransfer'],
        isDone: doc['isDone']);
  }
}
