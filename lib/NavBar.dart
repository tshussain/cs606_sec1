import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DogListView.dart';
import 'MoreDogs.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  List<String> _imageNames;
  @override
  final Size preferredSize = Size.fromHeight(50.0);

  NavBar(this._imageNames);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          TextButton(
              child: Text("Go to Dog List View"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => DogListView(_imageNames)));
              }),
          TextButton(
              child: Text("Go to More Dogs View"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => MoreDogs(_imageNames)));
              })
        ],
      ),
    );
    // IconButton(
    //     icon: Icon(Icons.forward),
    //     onPressed: () {
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => MoreDogs(_imageNames)));
    //     })

  }


  }

