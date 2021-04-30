import 'dart:async';
import 'dart:io';

import 'package:college_App/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:college_App/methods.dart';
import 'chat_screen.dart';
import 'home_page.dart';
import 'chatmain.dart';
import 'models/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AllUsersScreen extends StatefulWidget {
  _AllUsersScreenState createState() => _AllUsersScreenState();
  AllUsersScreen({Key key, this.openDrawerFunction}) : super(key: key);
  final VoidCallback openDrawerFunction;
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  StreamSubscription<QuerySnapshot> _subscription;
  List<DocumentSnapshot> usersList;
  String _name;
  String _email = '';
  final CollectionReference _collectionReference =
      Firestore.instance.collection(chatusers);
  FirebaseUser firebaseUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isSignedIn = false;

  @override
  _getCurrentUser(userlist) async {
    firebaseUser = await _auth.currentUser().catchError((error) {
      print(error);
    });
    print('FirebaseUser: ${firebaseUser.email.toString()}');
    _email = firebaseUser.email.toString();
    for (var i = 0; i < userlist.length; i++) {
      if (userlist[i].data['emailId'] == _email) {
        print("found at ${userlist[i]}");
        usersList.removeAt(i);
      }
    }
    return _email;
  }

  void initState() {
    super.initState();
    _subscription = _collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        usersList = datasnapshot.documents;
        print("Users List ${usersList.length}");
        _getCurrentUser(usersList);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Users"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await firebaseAuth.signOut();
                await googleSignIn.disconnect();
                await googleSignIn.signOut();
                print("Signed Out");
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyApp22()),
                    (Route<dynamic> route) => false);
              },
            )
          ],
        ),
        body: usersList != null
            ? Container(
                child: ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          // backgroundImage:
                          //   NetworkImage(usersList[index].data['photoUrl']),
                          ),
                      title: Text(usersList[index].data['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text(usersList[index].data[('emailId')],
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                      onTap: (() {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                    name: usersList[index].data['name'],
                                    //photoUrl: usersList[index].data['photoUrl'],
                                    receiverUid:
                                        usersList[index].data['uid'])));
                      }),
                    );
                  }),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
