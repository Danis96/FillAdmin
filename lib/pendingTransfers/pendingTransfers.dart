import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:filladmin/components/transferCard.dart';
import 'package:filladmin/doneTransfers/doneTransfers.dart';
import 'package:filladmin/fetchTransfers.dart';
import 'package:filladmin/firebaseMethods.dart/getTransfers.dart';
import 'package:filladmin/utils/screenUtils.dart';
import 'package:flutter/material.dart';

List pendingTransfersList = [];

class PendingTransfersHome extends StatefulWidget {
  @override
  _PendingTransfersHomeState createState() => _PendingTransfersHomeState();
}

class _PendingTransfersHomeState extends State<PendingTransfersHome> {
  String _nameSurname,
      _email,
      _dateOfBirth,
      _creditCardNumber,
      _expireDate,
      _cc,
      _dateOfTransfer;
  int _sarTransferred, _isDone;

  DocumentSnapshot _doc;

  getDataToVariables(int index, DocumentSnapshot _doc) {
    _nameSurname = _doc.data['name_and_surname'];
    _email = _doc.data['email'];
    _dateOfBirth = _doc.data['date_of_birth'];
    _creditCardNumber = _doc.data['card_number'];
    _expireDate = _doc.data['expipre_date'];
    _cc = _doc.data['cc'];
    _dateOfTransfer = _doc.data['date'];
    _sarTransferred = _doc.data['transferSar'];
    _isDone = _doc.data['isDone'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: GetTransfers().getTransfers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              pendingTransfersList = [];
              doneTransfersList = [];
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    _doc = snapshot.data[index];
                    if (_doc['isDone'] == 1) {
                      doneTransfersList.add(_doc);
                    }
                    /// punimo varijable
                    getDataToVariables(index, _doc);
                    return _isDone == 0
                        ? TransferCard(
                            refresh: refresh,
                            doc: _doc,
                            nameSurname: _nameSurname,
                            email: _email,
                            cc: _cc,
                            creditCardNumber: _creditCardNumber,
                            dateOfBirth: _dateOfBirth,
                            dateOfTransfer: _dateOfTransfer,
                            expireDate: _expireDate,
                            sarTransferred: _sarTransferred,
                            isDone: 0,
                          )
                        : EmptyContainer();
                  });
            } else {
              return EmptyContainer();
            }
          },
        ),
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}
