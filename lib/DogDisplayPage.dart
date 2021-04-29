


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'DogListView.dart';

class DogDisplayPage extends StatefulWidget {
  DogDisplayPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DogDisplayPageState createState() => _DogDisplayPageState();
}

class _DogDisplayPageState extends State<DogDisplayPage> {
  int _counter = 0;
  Color _color = Colors.blue;
  Color _color2 = Colors.red;
  double _width1 = 80;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myNameController = TextEditingController();
  String _name = "unknown";

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myNameController.addListener(_updateName());
  }

  _updateName() {
    setState(() {
      _name = myNameController.text;
    });
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myNameController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 1;
    });
  }

  void _toggleColour() {
    setState(() {
      if (_color == Colors.blue) {
        _color = Colors.green;
      } else {
        _color = Colors.blue;
      }
      _width1 = _width1 == 80 ? 160 : 80;
      _color2 = _color2 == Colors.red ? Colors.orange : Colors.red;
      // _counter+=1;
    });
  }

  List<String> _imageNames = ["assets/images/pug.jpg",
    "assets/images/lab.jpg", "assets/images/lab.jpg", "assets/images/pug.jpg"];

  List<Widget> getListOfImageWidgetsFromList(List<String> imageNames) {
    List<Widget> allWidgets = [];

    for (String imageName in imageNames) {
      Widget myWidget =
      Container(
          height: 80, width: _width1, color: _color,
          padding: EdgeInsets.all(10.0),
          child:Image.asset(imageName));
      allWidgets.add(myWidget);

    }
    return allWidgets;
  }



  // final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  // Widget getForm() {
  //   return Container(
  //       child: Form(
  //           key: this._formKey,
  //           child: new ListView(
  //               children: <Widget>[
  //                 TextFormField(
  //                     decoration: new InputDecoration(
  //                         hintText: 'Name',
  //                         labelText: 'Enter your name'
  //                     ),
  //                   onSaved: (String value) setState(() {
  //                     _visible = !_visible;
  //                   });
  //
  //                 ),
  //                 // We will add fields here.
  //                 TextFormField(
  //                     keyboardType: TextInputType.emailAddress,
  //                     // Use email input type for emails.
  //                     decoration: new InputDecoration(
  //                         hintText: 'you@example.com',
  //                         labelText: 'E-mail Address'
  //                     )),
  //
  //               ])));
  // }













  Widget _createRowOfImagesFromList(List<String> imageNames) {
    return Row(children: [
      // Apply the spread operator ...
      Text("These are my images"),
      ...getListOfImageWidgetsFromList(imageNames),
      Text("Those were my images")
    ]);
  }

  Widget _createRowOfImagesFromList2(List<String> imageNames) {
    return Row(children: getListOfImageWidgetsFromList(imageNames));
  }

  Widget _createRowOfImagesFromList3(List<String> imageNames) {
    return ListView.builder(
        itemCount: _imageNames.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(imageNames[index]));
        });
  }

  Widget _createRowOfImagesFromList4(List<String> imageNames) {
    return ListView.builder(
        itemCount: imageNames.length,
        itemBuilder: (context, index) {
          return Container(
              height: 80, width: _width1, color: _color,
              padding: EdgeInsets.all(10.0),
              child:Image.asset(imageNames[index]));
        });
  }



  /// Helper function to create a row of containers
  Widget _createRowOfImages() {
    return Row(children: [
      Container(
          height: 80, width: _width1, color: _color,
          padding: EdgeInsets.all(10.0),
          child:Image.asset("assets/images/pug.jpg")),
      Container(height: 80, width: 80, color: _color2,
          padding: EdgeInsets.all(10.0),
          child: Image.asset("assets/images/pug.jpg")),
      Container(height: 80, width: 80, color: _color2,
          padding: EdgeInsets.all(10.0),
          child: Image.asset("assets/images/lab.jpg")),
    ]);
  }

  /// Helper function to create a row of containers
  Widget _createRowOfContainers() {
    return Row(children: [
      Container(
          height: 100, width: _width1, color: _color, child: Text("Blue Box")),
      Container(height: 80, width: 80, color: _color2, child: Text("Red Box")),
    ]);
  }

  @override
  Widget build(BuildContext context) {

    List<int> numberStore = [0, 1, 2];
    int newNumber = 12;
    List<Object> anotherList = [...numberStore, newNumber];


    // Cat c = Cat();
    // Horse h = Horse();
    // Animal a;
    //
    // a = (Animal) c;
    // a.sound();
    //
    // a.scratch();

    // Cat c = Cat();
    // Horse h = Horse();
    // Animal a = Animal();
    //
    // c.sound();
    // h.sound();
    // a = c;
    // a.sound();  // polymorphism in action
    //
    // List<Animal> animals = [];
    // animals.add(c);
    // animals.add(h);
    // animals.add(a);
    //
    // for (Animal animal in animals) {
    //   animal.sound();
    // }
    //
    //
    // MixItUp mx = MixItUp();
    // mx.methodA();
    // mx.methodD();
    // classA ca = mx;
    // ca.methodA();
    // ca.methodD();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
      // _createRowOfImagesFromList4(_imageNames),
      SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(children: [
            // Container(
            //     height: 400,
            //    child: ,
            // ),
            Container(
              width:100,
              child: TextField(
                onSubmitted: (text) {
                  setState(() {
                    _name = text;
                  }); },
              ),
            ),
            Text("Name is " + _name),
            TextButton(
                child: Text("Go to Dog List View"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => DogListView(_imageNames)));
                }
            ),


            // _createRowOfImagesFromList3(_imageNames),
            // Container(
            //     height: 100,
            //     width: 100,
            //     color: _color,
            //     child: Image.asset("assets/images/pug.jpg"),
            //     padding: EdgeInsets.all(10.0)
            // ),
            //
            // Row(
            //     children: <Widget>[
            //       buildMenu(),
            //       buildMainColumn(),
            //     ]),
            // Row(children: <Widget>[
            //   Text('You have pushed the button this many times:'),
            //   Text(
            //     '$_counter',
            //     style: Theme
            //         .of(context)
            //         .textTheme
            //         .headline4,
            //   ),
            // ]),
          ]),
        ),
      ),



      floatingActionButton:
      FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      )
      , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column buildMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _createRowOfContainers(),
        _createRowOfContainers(),
        _createRowOfContainers(),
        _createRowOfContainers(),
        _createRowOfContainers(),
        _createRowOfContainers(),
        _createRowOfContainers(),
        _createRowOfContainers(),
      ],
    );
  }

  Column buildMainColumn() {
    return Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _createRowOfImages(),
          _createRowOfContainers(),
          _createRowOfContainers(),
          _createRowOfContainers(),
          Row(children: <Widget>[
            ImageButton(
              children: <Widget>[],
              width: 100,
              height: 100,
              paddingTop: 5,
              pressedImage: Image.asset(
                "assets/images/lab.jpg",
              ),
              unpressedImage: Image.asset("assets/images/pug.jpg"),
              onTap: () {
                _toggleColour();
                _incrementCounter();
              },
            ),
            Stack(children: [
              Container(
                  height: 100,
                  width: _width1,
                  color: _color,
                  child: Text("Blue Box")),
              Container(
                  height: 80,
                  width: 80,
                  color: _color2,
                  child: Text("Red Box")),
            ]),
          ])
        ]);
  }
}
