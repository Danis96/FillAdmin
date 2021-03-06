import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/colors.dart';
import 'package:filladmin/components/loaderDialog.dart';
import 'package:filladmin/components/mySnackbar.dart';
import 'package:filladmin/components/text.dart';
import 'package:filladmin/firebaseMethods.dart/updateTransfers.dart';
import 'package:filladmin/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool isVisible = false;

final GlobalKey<State> _keyLoader1 = new GlobalKey<State>();

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
  final Function refresh, refreshDash;
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
      this.refreshDash,
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
      height: widget.isDone == 1
          ? ScreenUtil.instance.setHeight(280.0)
          : ScreenUtil.instance.setHeight(330.0),
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
            Text(CustomText().name + widget.nameSurname),
            Text(CustomText().email + widget.email),
            Text(CustomText().dob + widget.dateOfBirth),
            Text(CustomText().dof + widget.dateOfTransfer),
            Text(CustomText().cash +
                widget.sarTransferred.toString() +
                CustomText().sar),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Divider(),
            ),
            Text(CustomText().ccn + widget.creditCardNumber),
            Text(CustomText().expire + widget.expireDate),
            Text(CustomText().cc + widget.cc),
            Container(
              child: Divider(),
            ),
            widget.isDone == 1
                ? Text(CustomText().doaf + widget.dateOfAdminTransfer)
                : Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(30.0)),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            CustomText().transfer +
                                widget.sarTransferred.toString() +
                                CustomText().sar,
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(20.0)),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: _checkBoxValue,
                              onChanged: (bool value) {
                                setState(() {
                                  _checkBoxValue = value;
                                });

                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text('Are you sure?'),
                                          content: new Text(
                                              'By choosing "Yes" transfer will be completed'),
                                          actions: <Widget>[
                                            new FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  _checkBoxValue = false;
                                                });
                                              },
                                              child: new Text('No'),
                                            ),
                                            new FlatButton(
                                              onPressed: () => {
                                                Navigator.pop(context),
                                                transferBegin(),
                                              },
                                              child: new Text('Yes  '),
                                            ),
                                          ],
                                        ));
                              },
                              checkColor: CustomColors().white,
                              activeColor: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  /// function transfer
  transferBegin() {
    Dialogs.showLoadingDialog(context, _keyLoader1);
    if (_checkBoxValue) {
      UpdateTransfers().update(widget.doc, DateTime.now().toString());
      Timer(Duration(milliseconds: 500), () {
         Navigator.of(_keyLoader1.currentContext, rootNavigator: true).pop();
        transferSuccessfull();
        widget.refresh();
        widget.refreshDash();
      });
    }
  }

  /// snackbar for transfer succesfull
  transferSuccessfull() {
    MySnackbar().showSnackbar(CustomText().snackSuccess, context, '');
  }
}
