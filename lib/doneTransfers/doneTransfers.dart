import 'package:filladmin/components/colors.dart';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:filladmin/components/transferCard.dart';
import 'package:filladmin/fetchTransfers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    FetchTransfers();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
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
            dateOfAdminTransfer =
                doneTransfersList[index].data['dateOfAdminTransfer'];
            sarTransferred = doneTransfersList[index].data['transferSar'];
            DateTime date = DateTime.parse(dateOfTransfer);
            dateOfTransfer = DateFormat.yMMMd().format(date);
            return TransferCard(
                nameSurname: nameSurname,
                email: email,
                dateOfBirth: dateOfBirth,
                dateOfTransfer: dateOfTransfer,
                sarTransferred: sarTransferred,
                creditCardNumber: creditCardNumber,
                expireDate: expireDate,
                cc: cc,
                dateOfAdminTransfer: dateOfAdminTransfer,
                isDone: 1);
          },
        ),
      ),
    );
  }
}
