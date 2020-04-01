class Transfer {
  final String nameSurname;
  final String email;
  final String dateOfBirth;
  final String creditCardNumber;
  final String expireDate;
  final String cc;
  final String dateOfTransfer;
  final String sarTransfered;
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
        nameSurname: doc[''],
        email: doc[''],
        dateOfBirth: doc[''],
        creditCardNumber: doc[''],
        expireDate: doc[''],
        cc: doc[''],
        dateOfTransfer: doc[''],
        sarTransfered: doc[''],
        dateOfAdminTransfer: doc[''],
        isDone: doc['']);
  }
}
