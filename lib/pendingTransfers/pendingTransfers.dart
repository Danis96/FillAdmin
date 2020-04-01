import 'package:filladmin/components/colors.dart';
import 'package:filladmin/fetchTransfers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flare_checkbox/flare_checkbox.dart';

class PendingTransfersHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
           FetchTransfers(),
          CardTransfer(),
          CardTransfer(),
          CardTransfer(),
          CardTransfer()
        ],
      ),
    );
  }
}

class CardTransfer extends StatefulWidget {
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
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, right: 20.0, left: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: CustomColors().black, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text('Danis',
                    style: TextStyle(
                      color: CustomColors().black,
                      fontSize: 22.0,
                    )),
                Text('Danis',
                    style:
                        TextStyle(color: CustomColors().black, fontSize: 18.0)),
                Text('Danis',
                    style:
                        TextStyle(color: CustomColors().black, fontSize: 18.0)),
                Text('Danis',
                    style:
                        TextStyle(color: CustomColors().black, fontSize: 18.0)),
                Text('Danis',
                    style:
                        TextStyle(color: CustomColors().black, fontSize: 18.0)),
                Text('Danis',
                    style:
                        TextStyle(color: CustomColors().black, fontSize: 18.0)),
                Text('Danis',
                    style:
                        TextStyle(color: CustomColors().black, fontSize: 18.0)),
                Text('Danis',
                    style:
                        TextStyle(color: CustomColors().black, fontSize: 18.0)),
                Text('Danis',
                    style:
                        TextStyle(color: CustomColors().black, fontSize: 18.0)),
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
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            color: CustomColors().black,
                          ),
                        ),
                      ),
                      Container(
                        child: 
                         Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: _checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxValue = value;
                            });
                            print(_checkBoxValue);
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
}
