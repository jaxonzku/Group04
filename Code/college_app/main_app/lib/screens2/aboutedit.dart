import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class aboutedit extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<aboutedit> {
  final textcontroller = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  void addData(String data) {
    databaseRef
        .push()
        .set({'aboutme': data}); //'name': data, 'comment': 'A good season'
  }

  String printFirebase() {
    databaseRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
      return ('Data : ${snapshot.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    printFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Demo"),
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 250.0),
                    SizedBox(height: 20.0),
                    TextField(
                        controller: textcontroller,
                        decoration: InputDecoration(
                          hintText: 'write about you',
                          border: OutlineInputBorder(),
                        )),
                    SizedBox(height: 30.0),
                    Center(
                        child: RaisedButton(
                            color: Colors.green,
                            child: Text("update"),
                            onPressed: () {
                              addData(textcontroller.text);
                              printFirebase();
                              //call method flutter upload
                            })),
                  ],
                ),
              );
            }
          }),
    );
  }
}

/*


 addData(textcontroller.text);import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class aboutedit extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<aboutedit> {
  final textcontroller = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  void addData(String data) {
    databaseRef.push().set({'name': data, 'comment': 'A good season'});
  }

  void printFirebase() {
    databaseRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  static const String _title = 'About me';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return new Stack(
      children: <Widget>[
        Positioned(
            width: 390.0,
            top: MediaQuery.of(context).size.height / 4.3,
            child: Column(
              children: <Widget>[
                Container(),
                SizedBox(height: 20.0),
                TextField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                      hintText: 'write about you',
                      border: OutlineInputBorder(),
                    )),
                SizedBox(height: 15.0),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          _uploadaboutedit(context);
                        },
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 25.0),
              ],
            ))
      ],
    ););
  }
}

void _uploadaboutedit(BuildContext context) {
  print('about me');
}
*/
