import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_auth/constants.dart';

class AdminPage extends StatelessWidget {
  AdminPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Admin"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Hallo $username',
            style: TextStyle(fontSize: 20.0),
          ),
          RaisedButton(
            child: Text("LogOUt"),
            onPressed: () async {
              await setloggedf();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
              // Navigator.pushReplacementNamed(context, '/login_screen');
            },
          ),
        ],
      ),
    );
  }
}

setloggedf() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('logged', false);
  Fluttertoast.showToast(
      msg: "setfalse",
      backgroundColor: Colors.grey,
      fontSize: 25,
      gravity: ToastGravity.TOP,
      textColor: Colors.pink);
}
