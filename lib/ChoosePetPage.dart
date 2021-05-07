
import 'package:flutter/material.dart';
import 'dart:async';

import 'model/PetRecord.dart';
import 'database/DBHelper.dart';

class ChoosePetPage extends StatefulWidget {
  @override
  _ChoosePetPageState createState() => new _ChoosePetPageState();
}

class _ChoosePetPageState extends State<ChoosePetPage> {
  PetRecord _selectedItem; // Variable to store the value selected in the pulldown.

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pet Record List'),
      ),
      body: Column(
        children: [
          new Container(
            padding: new EdgeInsets.all(16.0),
            child: new FutureBuilder<List<PetRecord>>(
              future: fetchPetRecordsFromDatabase(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DropdownMenuItem<PetRecord>> menuItems = _getListOfMenuItems(snapshot.data);
                  return DropdownButton<PetRecord>(
                      value: _selectedItem,
                      items: menuItems,
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value;
                        });
                      }
                  );
                } else if (snapshot.data == null) {
                  return new Container(alignment: AlignmentDirectional.center,
                    child: new CircularProgressIndicator(),);
                } else if (snapshot.data.length == 0) {
                  return new Text("No Data found");
                }
                return new Container(alignment: AlignmentDirectional.center,
                  child: new CircularProgressIndicator(),);
              },
            ),
          ),
          Text("You have chosen pet " +
          (_selectedItem == null ? "none" : _selectedItem.petName))
        ],
      ),
    );
  }
}
/// Create a list of drop-down meu items, one per pet.  The value given when the user
///   selects a menu item is the underlying petRecord.
List<DropdownMenuItem<PetRecord>> _getListOfMenuItems(List<PetRecord> petRecords) {
  List<DropdownMenuItem<PetRecord>> items = [];
  for (PetRecord petRecord in petRecords) {
    items.add(
      // Each menu item display a string, and when selected, will provide
      //   the indicated value.  That value may be a primitive, String or
      //   complex object.  In the latter case, make sure that the class
      //   has its == function defined (use IDE to generate it)
        DropdownMenuItem(
            child: Text(petRecord.petName),
            value: petRecord
        ));
  }
  return items;
}


Future<List<PetRecord>> fetchPetRecordsFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<PetRecord>> petRecords = dbHelper.getPetRecords();
  return petRecords;
}