import 'package:filladmin/fetchTransfers.dart';
import 'package:filladmin/pendingTransfers/cardPending.dart';
import 'package:flutter/material.dart';

List pendingTransfersList = [];

class PendingTransfersHome extends StatefulWidget {
  @override
  _PendingTransfersHomeState createState() => _PendingTransfersHomeState();
}

class _PendingTransfersHomeState extends State<PendingTransfersHome>  with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() { 
    super.initState();
    /// Animation controller instance
    ///
    /// vsync - frame ticking & duration
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    animationController.forward();
  }

  String _nameSurname,
      _email,
      _dateOfBirth,
      _creditCardNumber,
      _expireDate,
      _cc,
      _dateOfTransfer;

  int _sarTransferred;

  getDataToVariables(int index) {
    _nameSurname = pendingTransfersList[index].data['name_and_surname'];
    _email = pendingTransfersList[index].data['email'];
    _dateOfBirth = pendingTransfersList[index].data['date_of_birth'];
    _creditCardNumber = pendingTransfersList[index].data['card_number'];
    _expireDate = pendingTransfersList[index].data['expipre_date'];
    _cc = pendingTransfersList[index].data['cc'];
    _dateOfTransfer = pendingTransfersList[index].data['date'];
    _sarTransferred = pendingTransfersList[index].data['transferSar'];
    print(_nameSurname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          FetchTransfers(),
          AnimatedList(
              shrinkWrap: true,
              initialItemCount: pendingTransfersList.length,
              itemBuilder: (context, index, Animation animation) {
                /// punimo varijable
                getDataToVariables(index);

                return CardTransfer(
                  nameSurname: _nameSurname,
                  email: _email,
                  cc: _cc,
                  creditCardNumber: _creditCardNumber,
                  dateOfBirth: _dateOfBirth,
                  dateOfTransfer: _dateOfTransfer,
                  expireDate: _expireDate,
                  sarTransferred: _sarTransferred,
                );
              }),
        ],
      ),
    );
  }
}
