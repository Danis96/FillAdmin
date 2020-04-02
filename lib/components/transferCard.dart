import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/colors.dart';
import 'package:filladmin/components/mySnackbar.dart';
import 'package:filladmin/firebaseMethods.dart/updateTransfers.dart';
import 'package:filladmin/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool isVisible = false;

class TransferCard extends StatefulWidget {
  final String nameSurname,
      email,
      dateOfBirth,
      creditCardNumber,
      expireDate,
      cc,
      dateOfTransfer,
      dateOfAdminTransfer;
  final int sarTransferred, isDone;
  final DocumentSnapshot doc;
  final Function refresh;
  const TransferCard(
      {Key key,
      this.doc,
      this.refresh,
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
  _TransferCardState createState() => _TransferCardState();
}

class _TransferCardState extends State<TransferCard> {
  bool _checkBoxValue = false;

  @override
  void initState() {
    super.initState();
    _checkBoxValue = false;
  }

  @override
  Widget build(BuildContext context) {
    Constant().responsive(context);
    return Container(
      key: UniqueKey(),
      height: ScreenUtil.instance.setHeight(330.0),
      margin: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(20.0)),
      decoration: BoxDecoration(
          color: Colors.black54,
          border: Border.all(color: CustomColors().black, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name and surname: ' + widget.nameSurname),
            Text('E-mail address: ' + widget.email),
            Text('Date of birth: ' + widget.dateOfBirth),
            Text('Date of transfer: ' + widget.dateOfTransfer),
            Text('Amount of cash transfered: ' +
                widget.sarTransferred.toString() +
                ' SAR'),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Divider(),
            ),
            Text('Credit card number: ' + widget.creditCardNumber),
            Text('Expire date: ' + widget.expireDate),
            Text('CC: ' + widget.cc),
            Container(
              child: Divider(),
            ),
            widget.isDone == 1
                ? Text('Date of admin transfer: ' + widget.dateOfAdminTransfer)
                : Column(
                    children: <Widget>[
                      Container(
                        child: Text('Transfer ' +
                            widget.sarTransferred.toString() +
                            ' SAR'),
                      ),
                      Center(
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: _checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxValue = value;
                            });
                            if (_checkBoxValue) {
                              UpdateTransfers().update(
                                  widget.doc, DateTime.now().toString());
                              Timer(Duration(milliseconds: 300), () {
                                transferSuccessfull();
                                 widget.refresh();
                              });
                            }
                          },
                          checkColor: CustomColors().white,
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  /// snackbar for transfer succesfull
  transferSuccessfull() {
    MySnackbar().showSnackbar('Transfer is Successfull', context, '');
  }
}
