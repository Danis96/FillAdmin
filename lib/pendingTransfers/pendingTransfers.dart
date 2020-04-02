import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:filladmin/components/transferCard.dart';
import 'package:filladmin/firebaseMethods.dart/getTransfers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

  File jsonFile;

class PendingTransfersHome extends StatefulWidget {
  final Function refreshDash;
  PendingTransfersHome(this.refreshDash);
  @override
  _PendingTransfersHomeState createState() => _PendingTransfersHomeState();
}

class _PendingTransfersHomeState extends State<PendingTransfersHome>
    with AutomaticKeepAliveClientMixin<PendingTransfersHome> {
  String _nameSurname,
      _email,
      _dateOfBirth,
      _creditCardNumber,
      _expireDate,
      _cc,
      _dateOfTransfer;
  int _sarTransferred, _isDone;

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
    DateTime date = DateTime.parse(_dateOfTransfer);
    String time = DateFormat.Hm().format(date);
    _dateOfTransfer = DateFormat.yMMMd().format(date) + ' at ' + time;
  }

  void createFile(
      Map<String, dynamic> content, Directory dir, String fileName) {
    File file = new File(dir.path + '/' + fileName);
    path = file.path;
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, String value) {
    Map<String, String> content = {key: value};
    if (fileExists) {
      Map<String, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
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
        child: 
            FutureBuilder(
              future: GetTransfers().getTransfers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        _doc = snapshot.data[index];

                       
                        /// punimo varijable
                        getDataToVariables(index, _doc);

                       /// upisujemo u json file koji kreiramo za export
                        writeToFile('$index. Name and surname',
                            _nameSurname.toString());
                        writeToFile('$index. E-mail', _email.toString());
                        writeToFile(
                            '$index. Date of birth', _dateOfBirth.toString());
                        writeToFile('$index. Credit card number',
                            _creditCardNumber.toString());
                        writeToFile(
                            '$index. Expire date', _expireDate.toString());
                        writeToFile('$index. CC', _cc.toString());
                        writeToFile('$index. Date of transfer',
                            _dateOfTransfer.toString());
                        writeToFile('$index. SAR transferred',
                            _sarTransferred.toString());
                        writeToFile('$index. Done', _isDone.toString());

                        return _isDone == 0
                            ? TransferCard(
                                refreshDash: widget.refreshDash,
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
      ),
    );
  }

  refresh() {
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}