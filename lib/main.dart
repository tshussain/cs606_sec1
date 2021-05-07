
import 'package:cs606_sec1/ChoosePetPage.dart';
import 'package:cs606_sec1/EnterPetRecord.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'DogDisplayPage.dart';
import 'ListPetRecordsPage.dart';
import 'database/DBHelper.dart';


// https://medium.com/@rajajawahar77/sqflite-database-in-flutter-c0b7be83bcd2

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // Here we take the valu
          // e from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body:
            SingleChildScrollView(
              child: Center(
                child: Column(children: [
                ResponsiveGridRow(children:[
                ResponsiveGridCol(
                    xs:6,
                    md:12,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EnterPetRecordPage())
                        );
                      },
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/lab.jpg"),
                              fit: BoxFit.fitWidth
                          )
                        ),
                        child: Text("Enter Pet")
                    ))),
                ResponsiveGridCol(
                    xs:6,
                    md:12,
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DogDisplayPage())
                        );
                      },
                      child: Container(
                          height: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/pug.jpg"),
                                  fit: BoxFit.fitWidth
                              )
                          ),
                          child: Text("Display Dogs")
                      ))

                    ),
                  ]),
                  ResponsiveGridRow(children:[
                    ResponsiveGridCol(
                        xs:12,
                        md:4,
                        lg:3,
                        child: Container(
                          height: 100,
                          color: Colors.blue,
                        )),
                    ResponsiveGridCol(
                        xs:12,
                        md: 8,
                        lg: 3,
                        child: Expanded(
                          child: Container(
                            height: 100,
                            color: Colors.red,
                          ),
                        )),
                    ResponsiveGridCol(
                        xs:12,
                        md: 4,
                        lg: 3,
                        child: Container(
                          height: 100,
                          color: Colors.orange,
                        )),
                    ResponsiveGridCol(
                        xs:12,
                        md: 8,
                        lg: 3,
                        child: Container(
                          height: 100,
                          color: Colors.green,
                        )),
                  ]),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EnterPetRecordPage())
                      );
                    },
                    child: Text("Enter Pet Record")
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListPetRecordsPage())
                        );
                      },
                      child: Text("List Pet Records")
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChoosePetPage())
                        );
                      },
                      child: Text("Choose Pet")
                  ),

                ],)

              ),
            ),
      ),
    );
  }

}
