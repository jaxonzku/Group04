import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_App/constants.dart';
import 'package:college_App/pages/app/home/anoun.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  String key;
  String key2;
  String key22;
  FirebaseUser user;
  String _fullName;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  TextEditingController _passwordController3 = TextEditingController();
  TextEditingController _passwordController4 = TextEditingController();
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    }
  ];
  String result = "";
  TextEditingController myController;
//  }

  void handleError(String s) {
    print("err:$s");
    setState(() {
      // _inProgress = false;
    });
  }

  checkeAuth(key2) async {
    var snapshot = await FirebaseDatabase.instance
        .reference()
        .child(appname)
        .child('validation')
        .child('key')
        .once()
        .catchError((error) {
      print("here1");
      print(error.toString());
      print("here2");
      handleError(error.toString());
    });
    if (snapshot.value != null) {
      String key1 = snapshot.value;
      print(key1);
      print(_passwordController.text);
      if (key1 == _passwordController.text) {
        print('matched');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      right: -40.0,
                      top: -40.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Enter your Announcement"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Title',
                                // icon: Icon(Icons.list),
                              ),
                              controller: _passwordController2,
                              onSaved: (value) => key22 = value,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Description',
                                // icon: Icon(Icons.list),
                              ),
                              controller: _passwordController3,

                              //

                              onSaved: (value) => key22 = value,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'url',
                                // icon: Icon(Icons.list),
                              ),
                              controller: _passwordController4,
                              onSaved: (value) => key22 = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Upload"),
                              onPressed: () {
                                //print('here');
                                // print(_passwordController2.text);
                                userSetup(
                                    _passwordController2.text.toString(),
                                    _passwordController3.text.toString(),
                                    _passwordController4.text.toString());
                                Navigator.of(context).pop();

                                // {"data": FieldValue.arrayUnion(map)});
                              }

                              // if (_formKey.currentState.validate()) {
                              // _formKey.currentState.save();

                              ,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
        return true;
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      right: -40.0,
                      top: -40.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Wrong code.Pease try again"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      }
    }
  }

  Widget commentChild() {
    return Scaffold(
      body: Container(
        child: CommentBox(
          userImage:
              "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          // child: commentChild(filedata),
          labelText: 'Write your announcement',
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {},
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: "My Text Field",
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Only authorised users can make an announcement.',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'If you are an authorised user please enter the code',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                          controller: _passwordController,
                          onSaved: (value) => key2 = value,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "Enter your code here ...",
                          )),
                      SizedBox(height: 10),
                      RaisedButton(
                        onPressed: () {
                          print("pressed");
                          // _sendTo(StudentLoginPage());
                          checkeAuth(key2);
                        },
                        shape: new StadiumBorder(),
                        color: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 10.0),
                        child: Text(
                          'Authorise',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ]))));
  }
}
