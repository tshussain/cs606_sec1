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

  List<Widget> getListOfImageWidgetsFromList(List<String> imageNames) {
    List<Widget> allWidgets = [];

    for (String imageName in imageNames) {
      Widget myWidget = Container(
          height: 80,
          width: 100,
          color: Colors.blue,
          padding: EdgeInsets.all(10.0),
          child: Image.asset(imageName));
      allWidgets.add(myWidget);
    }
    return allWidgets;
  }

  Widget _createRowOfImagesFromList4(List<String> imageNames) {
    return ListView.builder(
        itemCount: imageNames.length,
        itemBuilder: (context, index) {
          return Container(
              // height: 80,
              // width: 100,
              color: Colors.blue,
              padding: EdgeInsets.all(10.0),
              child: Image.asset(imageNames[index]));
        });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(children: [...getListOfImageWidgetsFromList(_imageNames)])),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createRowOfImagesFromList4(_imageNames));
  }
}
