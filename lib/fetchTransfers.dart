import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:filladmin/doneTransfers/doneTransfers.dart';
import 'package:filladmin/firebaseMethods.dart/getTransfers.dart';
import 'package:flutter/material.dart';

DocumentSnapshot doc;
List<dynamic> doneStransfersList = [];

class FetchTransfers extends StatelessWidget {
  FetchTransfers({Key key}) : super(key: key);

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
                doc = snapshot.data[index];
                if(doc['isDone'] == 1) {
                  doneTransfersList.add(doc);
                }
                return EmptyContainer();
              });
        }
        return EmptyContainer();
      },
    );
  }
}
