import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/colors.dart';
import 'package:filladmin/fetchTransfers.dart';
import 'package:filladmin/utils/screenUtils.dart';
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
          CardTransfer(),
          CardTransfer(),
          CardTransfer(),
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

    Constant().responsive(context);

    return Container(
      margin: EdgeInsets.only(bottom: 20.0, right: 20.0, left: 20.0),
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
                  name: 'Danis Preldzic',
                ),
                InfoCard(
                  info: 'danis.preldzic@gmail.com',
                ),
                InfoCard(
                  info: '11.03.1996.',
                ),
                InfoCard(
                  info: '5555-5555-5555-5555',
                ),
                InfoCard(
                  info: '08/23',
                ),
                InfoCard(
                  info: '057',
                ),
                InfoCard(
                  info: '23.03.2020.',
                ),
                InfoCard(
                  info: '105',
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
                        child: Text(
                          'Transfer' + '\n105 SARS',
                          style: TextStyle(
                            color: CustomColors().white,
                          ),
                        ),
                      ),
                      Container(
                        child: Checkbox(
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

class TitleCard extends StatelessWidget {
  final String name;
  const TitleCard({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 120.0),
      child: Text(name,
          style: TextStyle(
            color: CustomColors().white,
            fontSize: 22.0,
          )),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String info;
  const InfoCard({Key key, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30.0),
      child: Text(info,
          style: TextStyle(
            color: CustomColors().white,
            fontSize: 16.0,
          )),
    );
  }
}
