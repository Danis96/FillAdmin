import 'package:filladmin/components/colors.dart';
import 'package:flutter/material.dart';

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
