
import 'dart:async';

import 'package:filladmin/components/colors.dart';
import 'package:filladmin/components/mySnackbar.dart';
import 'package:filladmin/pendingTransfers/cardInfo.dart';
import 'package:filladmin/pendingTransfers/cardTitle.dart';
import 'package:filladmin/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTransfer extends StatefulWidget {
  final String nameSurname,
      email,
      dateOfBirth,
      creditCardNumber,
      expireDate,
      cc,
      dateOfTransfer;
  final int sarTransferred;
  CardTransfer(
      {this.sarTransferred,
      this.dateOfTransfer,
      this.expireDate,
      this.cc,
      this.creditCardNumber,
      this.dateOfBirth,
      this.email,
      this.nameSurname});
  @override
  _CardTransferState createState() => _CardTransferState();
}

class _CardTransferState extends State<CardTransfer> {
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
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
      decoration: BoxDecoration(
          color: Colors.black54,
          border: Border.all(color: CustomColors().black, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TitleCard(
                  name: widget.nameSurname,
                ),
                InfoCard(
                  info: widget.email,
                ),
                InfoCard(
                  info: widget.dateOfBirth,
                ),
                InfoCard(
                  info: widget.creditCardNumber,
                ),
                InfoCard(
                  info: widget.expireDate,
                ),
                InfoCard(
                  info: widget.cc,
                ),
                InfoCard(
                  info: widget.dateOfTransfer,
                ),
                InfoCard(
                  info: widget.sarTransferred.toString(),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            right: ScreenUtil.instance.setWidth(7.0)),
                        child: Column(
                          children: <Widget>[
                            Text('Transfer' + '\n' + widget.sarTransferred.toString() + ' SAR'),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: ScreenUtil.instance.setWidth(20.0)),
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: _checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxValue = value;
                            });
                            // UpdateTransfers().update(doc, dateOfAdminTransfer, isDone);
                            Timer(Duration(milliseconds: 500), () {
                                 transferSuccessfull();
                            });
                           
                          },
                          checkColor: CustomColors().white,
                          activeColor: Colors.green,
                          tristate: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  transferSuccessfull() {
  MySnackbar().showSnackbar('Transfer is Successfull', context, '');
  }
}

