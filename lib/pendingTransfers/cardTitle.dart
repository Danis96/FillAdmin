import 'package:filladmin/components/colors.dart';
import 'package:flutter/material.dart';

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