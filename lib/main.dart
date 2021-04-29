import 'package:cs606_sec1/PetRecord.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'Dog.dart';
import 'inclass_examples/Animal.dart';
import 'DogListView.dart';
import 'inclass_examples/MixItUp.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import com.tekartik.sqflite.SqflitePlugin;


// https://medium.com/@rajajawahar77/sqflite-database-in-flutter-c0b7be83bcd2

import 'dart:async';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _formKey = GlobalKey<FormState>();
  String _petName;
  int _petAge;

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
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
                        } else if (int.parse(value) < 0) {
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

  var _formKey = GlobalKey<FormState>();  // put this at the top of the class

  void _saveForm() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      // Create a PetRecord with the information from the form
      PetRecord petRecord = PetRecord(_petName, _petAge);
      print(petRecord);

      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Data saved successfully')));
    }
  }
}
