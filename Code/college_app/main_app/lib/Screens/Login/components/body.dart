import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/screens2/feed_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/AdminPage.dart';
import 'MemberPage.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

String username = '';
String password = '';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = new MyHttpOverrides();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new FeedScreen(),
        '/MemberPage': (BuildContext context) => new MemberPage(
              username: username,
            ),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    var url = Uri.parse('https://3.133.90.117/test/login.php');
    //var url = Uri.http('3.17.64.183', '/test/login.php', {'q': '{http}'});
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    }, body: {
      "username": username,
      "password": password,
    });
    if (response.statusCode == 200) {
      print("success");
    }

    var datauser = json.decode(response.body);
    print(datauser.length);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
        print("failed");

        Fluttertoast.showToast(
            msg: "invalid username and password",
            backgroundColor: Colors.grey,
            fontSize: 25,
            gravity: ToastGravity.TOP,
            textColor: Colors.pink);
      });
    } else {
      if (datauser[0]['status'] == '1') {
        Fluttertoast.showToast(
            msg: "login Success",
            backgroundColor: Colors.grey,
            fontSize: 25,
            gravity: ToastGravity.TOP,
            textColor: Colors.pink);
        setlogged();

        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (datauser[0]['status'] == '0') {
        Fluttertoast.showToast(
            msg: "login Success",
            backgroundColor: Colors.grey,
            fontSize: 25,
            gravity: ToastGravity.TOP,
            textColor: Colors.pink);
        Navigator.pushReplacementNamed(context, '/MemberPage');
      }
      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: kPrimaryColor, fontWeight: FontWeight.normal),
              textScaleFactor: 0.3,
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              onChanged: (text) {
                username = "$text";
              },
            ),
            RoundedPasswordField(
              onChanged: (text) {
                password = "$text";
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                _login();
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

setlogged() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('logged', true);
  Fluttertoast.showToast(
      msg: "setfalse",
      backgroundColor: Colors.grey,
      fontSize: 25,
      gravity: ToastGravity.TOP,
      textColor: Colors.pink);
}
