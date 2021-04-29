import 'package:flutter/material.dart';

import 'PetRecord.dart';
import 'database/DBHelper.dart';

class EnterPetRecordPage extends StatefulWidget {
  EnterPetRecordPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EnterPetRecordPageState createState() => _EnterPetRecordPageState();
}

class _EnterPetRecordPageState extends State<EnterPetRecordPage> {
  var _formKey = GlobalKey<FormState>();
  String _petName;
  int _petAge;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Pet Record"),
      ),
      body:
      SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                  children: [
                    TextFormField(
                      decoration: new InputDecoration(labelText: "Pet Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) => this._petName = value,
                    ),
                    TextFormField(
                      decoration: new InputDecoration(labelText: "Pet Age"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (int.tryParse(value) == null) {
                          return 'Please enter a number';
                        } else if (int.tryParse(value) < 0) {
                          return 'Please enter a non-negative age';
                        }
                        return null;
                      },
                      onSaved: (value) => this._petAge = int.parse(value),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _saveForm();
                        },
                        child: Text("Submit")
                    )

                  ]
              )
          ),

        ),
      ),
    );
  }

  void _saveForm() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      // Create a PetRecord with the information from the form
      PetRecord petRecord = PetRecord(_petName, _petAge);
      var dbHelper = DBHelper();
      dbHelper.savePetRecord(petRecord);
      print(petRecord);

      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Data saved successfully')));
    }
  }
}