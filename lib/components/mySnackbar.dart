import 'package:filladmin/components/colors.dart';
import 'package:flutter/material.dart';

class MySnackbar {
  void showSnackbar(
      String snackText, BuildContext context, String snackAction) {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: CustomColors().white,
      content: Text(
        snackText,
        style: TextStyle(color: CustomColors().black),
      ),
      action: SnackBarAction(
        label: snackAction,
        onPressed: () {},
      ),
    ));
  }
}
