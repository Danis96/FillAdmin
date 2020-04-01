import 'package:filladmin/components/colors.dart';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:flutter/material.dart';

class TransferCard extends StatelessWidget {
  final String nameSurname,
      email,
      dateOfBirth,
      creditCardNumber,
      expireDate,
      cc,
      dateOfTransfer,
      dateOfAdminTransfer;
  final int sarTransferred, isDone;
  const TransferCard(
      {Key key,
      this.dateOfAdminTransfer,
      this.expireDate,
      this.creditCardNumber,
      this.dateOfTransfer,
      this.sarTransferred,
      this.dateOfBirth,
      this.email,
      this.nameSurname,
      this.cc,
      this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.black54,
          border: Border.all(color: CustomColors().black, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name and surname: ' + nameSurname),
            Text('E-mail address: ' + email),
            Text('Date of birth: ' + dateOfBirth),
            Text('Date of transfer: ' + dateOfTransfer),
            Text('Amount of cash transfered: ' +
                sarTransferred.toString() +
                ' SAR'),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(),
            ),
            Text('Credit card number: ' + creditCardNumber),
            Text('Expire date: ' + expireDate),
            Text('CC: ' + cc),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(),
            ),
            isDone == 1
                ? Text('Date of admin transfer: ' + dateOfAdminTransfer)
                : EmptyContainer()
          ],
        ),
      ),
    );
  }
}
