import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavBar.dart';

class MoreDogs extends StatelessWidget {
  List<String> _imageNames;

  MoreDogs(this._imageNames);

  List<Widget> getListOfImageWidgetsFromList(List<String> imageNames) {
    List<Widget> allWidgets = [];

    for (String imageName in imageNames) {
      Widget myWidget =
      Container(
          height: 80, width: 100, color: Colors.green,
          padding: EdgeInsets.all(10.0),
          child:Image.asset(imageName));
      allWidgets.add(myWidget);

    }
    return allWidgets;
  }

  Widget _createRowOfImagesFromList(List<String> imageNames) {
    return Row(children: [
      // Apply the spread operator ...
      Text("These are my images"),
      ...getListOfImageWidgetsFromList(imageNames),
      Text("Those were my images")
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: NavBar(_imageNames),

      // AppBar(
      //     title: Text("More Dogs Page"),
      //     actions: <Widget>[
      //       IconButton(
      //           icon: Icon(Icons.arrow_back),
      //           onPressed: () {
      //             Navigator.pop(context);
      //           }
      //       )
      //     ]
      // ),
      body: _createRowOfImagesFromList(_imageNames),
    );
  }
}
