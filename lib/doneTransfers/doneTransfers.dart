import 'package:filladmin/components/emptyContainer.dart';
import 'package:filladmin/fetchTransfers.dart';
import 'package:flutter/material.dart';

List doneTransfersList = [];

class DoneTransfers extends StatelessWidget {
  DoneTransfers({Key key}) : super(key: key);

  String nameSurname,
      email,
      dateOfBirth,
      creditCardNumber,
      expireDate,
      cc,
      dateOfTransfer,
      dateOfAdminTransfer;
  int sarTransferred;

  @override
  Widget build(BuildContext context) {
    print('PRINT IZ DRUGOG TABA: ' + doneTransfersList.toString());
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: doneTransfersList.length,
        itemBuilder: (context, index) {
          nameSurname = doneTransfersList[index].data['name_and_surname'];
          email = doneTransfersList[index].data['email'];
          dateOfBirth = doneTransfersList[index].data['date_of_birth'];
          creditCardNumber = doneTransfersList[index].data['card_number'];
          expireDate = doneTransfersList[index].data['expipre_date'];
          cc = doneTransfersList[index].data['cc'];
          dateOfTransfer = doneTransfersList[index].data['date'];
          dateOfAdminTransfer = doneTransfersList[index].data['dateOfAdminTransfer'];
          sarTransferred = doneTransfersList[index].data['transferSar'];
          print('Name and surname: ' + nameSurname);
          print('Email: ' + email);
          print('Date of birth: ' + dateOfBirth);
          print('Credit card number: ' + creditCardNumber);
          print('Expire date: ' + expireDate);
          print('CC: ' + cc);
          print('Date of transfer: ' + dateOfTransfer);
          print('Date of admin transfer: ' + dateOfAdminTransfer);
          print('SAR transferred: ' + sarTransferred.toString());
          return EmptyContainer();
        },
      ),
    );
  }
}