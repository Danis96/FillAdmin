import 'dart:async';
import 'dart:io';
import 'package:filladmin/components/mySnackbar.dart';
import 'package:filladmin/components/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SendEmail extends StatefulWidget {
  final File file;
  SendEmail({Key key, this.file}) : super(key: key);

  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  List<String> attachments = [];
  String email = "fillproject966@gmail.com";
  String password = "kjpu8vk6";

  Future<void> sendEmail(String recipent, BuildContext context) async {
    final smtpServer = gmail(email, password);
    DateTime currentDateTime = DateTime.now();
    String subjectDate = DateFormat.yMMMd().format(currentDateTime);
    String time = DateFormat.Hm().format(currentDateTime);
    String emailSubject =
        CustomText().subject + ' - ' + subjectDate + ' at ' + time;
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(email)
      ..recipients.add(recipent) //recipent email
      ..attachments.add(FileAttachment(widget.file))
      ..subject = emailSubject //subject of the email
      ..text = CustomText().textMsg; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      emailSent();
      print('Message sent. ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent' +
          ' \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(CustomText().btnEmailText),
        onPressed: () {
          sendEmail('fillapp@f-intelli.com', context);
        });
  }

  emailSent() {
    MySnackbar().showSnackbar('Email is sent!', context, '');
  }
}
