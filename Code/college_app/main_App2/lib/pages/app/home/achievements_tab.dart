import 'package:comment_box/comment/comment.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    }
  ];
  String result = "";
  TextEditingController myController;

  void handleError(String s) {
    print("err:$s");
    setState(() {
      // _inProgress = false;
    });
  }

  checkeAuth(key2) async {
    var snapshot = await FirebaseDatabase.instance
        .reference()
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
                            child: TextFormField(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Upload"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                }
                              },
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
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
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
                      SizedBox(height: 60),
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
