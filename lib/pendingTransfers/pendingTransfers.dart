import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:filladmin/components/transferCard.dart';
import 'package:filladmin/doneTransfers/doneTransfers.dart';
import 'package:filladmin/export/sendEmail.dart';
import 'package:filladmin/fetchTransfers.dart';
import 'package:filladmin/firebaseMethods.dart/getTransfers.dart';
import 'package:filladmin/utils/screenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';

class PendingTransfersHome extends StatefulWidget {
  @override
  _PendingTransfersHomeState createState() => _PendingTransfersHomeState();
}

class _PendingTransfersHomeState extends State<PendingTransfersHome> {
  String _nameSurname,
      _email,
      _dateOfBirth,
      _creditCardNumber,
      _expireDate,
      _cc,
      _dateOfTransfer;
  int _sarTransferred, _isDone;
  File jsonFile;
  Directory dir;
  String fileName = 'transfers.json';
  String path;
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  DocumentSnapshot _doc;

  getDataToVariables(int index, DocumentSnapshot _doc) {
    _nameSurname = _doc.data['name_and_surname'];
    _email = _doc.data['email'];
    _dateOfBirth = _doc.data['date_of_birth'];
    _creditCardNumber = _doc.data['card_number'];
    _expireDate = _doc.data['expipre_date'];
    _cc = _doc.data['cc'];
    _dateOfTransfer = _doc.data['date'];
    _sarTransferred = _doc.data['transferSar'];
    _isDone = _doc.data['isDone'];
  }

  void createFile(
      Map<String, dynamic> content, Directory dir, String fileName) {
    print('Creating file!');
    File file = new File(dir.path + '/' + fileName);
    path = file.path;
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, String value) {
    print('Writing to file!');
    Map<String, String> content = {key: value + '\n'};
    if (fileExists) {
      print('File Exist!');
      Map<String, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print('File does not exist!');
      createFile(content, dir, fileName);
    }
    fileContent = json.decode(jsonFile.readAsStringSync());
  }

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + '/' + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: GetTransfers().getTransfers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  doneTransfersList = [];
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        _doc = snapshot.data[index];
                        if (_doc['isDone'] == 1) {
                          doneTransfersList.add(_doc);
                        }
                        writeToFile('$index. Name and surname', _nameSurname.toString());
                        writeToFile('$index. E-mail', _email.toString());
                        writeToFile('$index. Date of birth', _dateOfBirth.toString());
                        writeToFile(
                            '$index. Credit card number', _creditCardNumber.toString());
                        writeToFile('$index. Expire date', _expireDate.toString());
                        writeToFile('$index. CC', _cc.toString());
                        writeToFile('$index. Date of transfer', _dateOfTransfer.toString());
                        writeToFile(
                            '$index. SAR transferred', _sarTransferred.toString());
                        writeToFile('$index. Done', _isDone.toString());

                        /// punimo varijable
                        getDataToVariables(index, _doc);
                        return _isDone == 0
                            ? TransferCard(
                                refresh: refresh,
                                doc: _doc,
                                nameSurname: _nameSurname,
                                email: _email,
                                cc: _cc,
                                creditCardNumber: _creditCardNumber,
                                dateOfBirth: _dateOfBirth,
                                dateOfTransfer: _dateOfTransfer,
                                expireDate: _expireDate,
                                sarTransferred: _sarTransferred,
                                isDone: 0,
                              )
                            : EmptyContainer();
                      });
                } else {
                  return EmptyContainer();
                }
              },
            ),
            SendEmail(file: jsonFile)
          ],
        ),
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}
