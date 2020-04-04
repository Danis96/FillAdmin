import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/colors.dart';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:filladmin/components/transferCard.dart';
import 'package:filladmin/firebaseMethods.dart/getTransfers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoneTransfers extends StatefulWidget {
  DoneTransfers({Key key}) : super(key: key);

  @override
  _DoneTransfersState createState() => _DoneTransfersState();
}

class _DoneTransfersState extends State<DoneTransfers>
    with AutomaticKeepAliveClientMixin<DoneTransfers> {
  String _nameSurname,
      _email,
      _dateOfBirth,
      _creditCardNumber,
      _expireDate,
      _cc,
      _dateOfTransfer,
      _dateOfAdminTransfer;

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
    _dateOfAdminTransfer = _doc.data['dateOfAdminTransfer'];
    _isDone = _doc.data['isDone'];

    if (_dateOfAdminTransfer != '') {
      DateTime date2 = DateTime.parse(_dateOfAdminTransfer);
      String time2 = DateFormat.Hm().format(date2);
      _dateOfAdminTransfer = DateFormat.yMMMd().format(date2) + ' at ' + time2;
    } else {
      _dateOfAdminTransfer = '2020-04-03 16:29:06.876348';
    }

    DateTime date = DateTime.parse(_dateOfTransfer);
    String time = DateFormat.Hm().format(date);
    _dateOfTransfer = DateFormat.yMMMd().format(date) + ' at ' + time;
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
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        _doc = snapshot.data[index];

                        /// punimo varijable
                        getDataToVariables(index, _doc);

                        return _isDone == 1
                            ? TransferCard(
                                refresh: refresh,
                                doc: _doc,
                                nameSurname: _nameSurname,
                                email: _email,
                                dateOfBirth: _dateOfBirth,
                                dateOfTransfer: _dateOfTransfer,
                                sarTransferred: _sarTransferred,
                                creditCardNumber: _creditCardNumber,
                                expireDate: _expireDate,
                                cc: _cc,
                                dateOfAdminTransfer: _dateOfAdminTransfer,
                                isDone: 1)
                            : EmptyContainer();
                      });
                } else {
                  return Center(
                     child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }

  refresh() {
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
