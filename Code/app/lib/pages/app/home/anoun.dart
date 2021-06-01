import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_App/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> userSetup(
    String displayName, String description, String url) async {
  String title = displayName;
  FirebaseUser user;
  print('1');
  CollectionReference users;
  users = Firestore.instance.collection(appname + '-announcements');
  print('2');
  FirebaseAuth auth = FirebaseAuth.instance;
  print(displayName);

  print('4');
  // String uid = user.uid.toString();
  print('5');
  users.add({
    'title': title,
    'timeStamp': DateTime.now(),
    'description': description,
    'url': url,
    'type': "all"
  });
  print('6');
  return;
}
