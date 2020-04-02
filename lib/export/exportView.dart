import 'package:filladmin/export/sendEmail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filladmin/pendingTransfers/pendingTransfers.dart';

class ExportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0)),
            child: Center(
                child: Text(
              'Welcome admin \nHere you can export your transfers',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(22.0)),
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0), bottom: ScreenUtil.instance.setWidth(5.0)),
            child: Divider(
               height: ScreenUtil.instance.setHeight(10.0),
              thickness: 3.0,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
            child: Center(
                child: Text(
              'The file will contain all transfers\nand files will come to your email after clicking this button.',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(16.0)),
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0), bottom: ScreenUtil.instance.setWidth(5.0)),
            child: Divider(
              height: ScreenUtil.instance.setWidth(10.0),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil.instance.setWidth(140.0)),
              child: SendEmail(file: jsonFile),
            ),
          ),
        ],
      )),
    );
  }
}
