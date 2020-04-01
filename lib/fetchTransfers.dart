import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:filladmin/firebaseMethods.dart/getTransfers.dart';
import 'package:flutter/material.dart';

class FetchTransfers extends StatelessWidget {
  FetchTransfers({Key key}) : super(key: key);

  String nameSurname,
      email,
      dateOfBirth,
      creditCardNumber,
      expireDate,
      cc,
      dateOfTransfer,
      dateOfAdminTransfer;
  int sarTransferred, isDone;
  DocumentSnapshot doc;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetTransfers().getTransfers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print('3');
                doc = snapshot.data[index];
                return EmptyContainer();
              });
        }
        return EmptyContainer();
      },
    );
  }
}
