// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'MoreDogs.dart';
import 'NavBar.dart';

class DogListView extends StatelessWidget {
  List<String> _imageNames;

  // = ["assets/images/pug.jpg",
  //   "assets/images/lab.jpg", "assets/images/lab.jpg", "assets/images/pug.jpg"];

  DogListView(this._imageNames);

  Widget _createRowOfImagesFromList4(List<String> imageNames) {
    return ListView.builder(
        itemCount: imageNames.length,
        itemBuilder: (context, index) {
          return Container(
              height: 80,
              width: 100,
              color: Colors.blue,
              padding: EdgeInsets.all(10.0),
              child: Image.asset(imageNames[index]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(_imageNames),
      // AppBar(
      //     title: Text("Dog View Page"),
      //     actions: <Widget>[
      //   IconButton(
      //       icon: Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       }),
      //   IconButton(
      //       icon: Icon(Icons.forward),
      //       onPressed: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => MoreDogs(_imageNames)));
      //       })
      // ]),
      body: _createRowOfImagesFromList4(_imageNames),
    );
  }
}
