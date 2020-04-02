import 'dart:io';
import 'dart:convert';
import 'package:filladmin/components/emptyContainer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class ExportTransfers extends StatefulWidget {
  ExportTransfers({Key key}) : super(key: key);

  @override
  _ExportTransfersState createState() => _ExportTransfersState();
}

class _ExportTransfersState extends State<ExportTransfers> {

  File jsonFile;
  Directory dir;
  String fileName = 'transfers.json';
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  void initState() { 
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + '/' + fileName);
      fileExists = jsonFile.existsSync();
      if(fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    File file = new File(dir.path + '/' + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, String value) {
    Map<String, String> content = {key: value};
    if(fileExists) {
      Map<String, String> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return EmptyContainer();
  }
}