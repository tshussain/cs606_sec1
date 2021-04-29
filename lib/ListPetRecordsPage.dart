
import 'package:flutter/material.dart';
import 'dart:async';

import 'PetRecord.dart';
import 'database/DBHelper.dart';

Future<List<PetRecord>> fetchPetRecordsFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<PetRecord>> petRecords = dbHelper.getPetRecords();
  return petRecords;
}

class ListPetRecordsPage extends StatefulWidget {
  @override
  ListPetRecordsPageState createState() => new ListPetRecordsPageState();
}

class ListPetRecordsPageState extends State<ListPetRecordsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pet Record List'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<PetRecord>>(
          future: fetchPetRecordsFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(snapshot.data[index].petName,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                          new Text(snapshot.data[index].petAge.toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          new Divider()
                        ]);
                  });
            } else if (snapshot.data.length == 0) {
              return new Text("No Data found");
            }
            return new Container(alignment: AlignmentDirectional.center,child: new CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}