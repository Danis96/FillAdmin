import 'dart:io';
import 'package:flutter/material.dart';
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
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(email)
      ..recipients.add(recipent) //recipent email
      ..attachments.add(FileAttachment(widget.file))
      ..subject = 'Transfers' //subject of the email
      ..text = 'Here is your transfers JSON file.'; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
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
        child: Text('Send Email'),
        onPressed: () {
          sendEmail('danis.preldzic@gmail.com', context);
        });
  }
}