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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetTransfers().getTransfers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('FUTURE 1');
        if (snapshot.hasData) {
          print('FUTURE 2');
          return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print('FUTURE 3');
                print(snapshot.data[index]);
                return Container(
                  height: 0,
                  width: 0,
                );
              });
        }
        return Container(
          height: 0,
          width: 0,
        );
      },
    );
  }
}
