import 'package:flutter/material.dart';
import 'package:flutter_auth/AdminPage.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/screens2/feed_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO " + college_name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/college_logo.png",
              // SvgPicture.asset(
              // "assets/icons/chat.svg",
              // width: size.width * 0.,
              // height: size.height * 0.05,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Lets Go",
              press: () async {
                bool visitingflag = await getVisitingFlag();
                if (visitingflag == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FeedScreen();
                      },
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                }
              },
            ), //
          ],
        ),
      ),
    );
  }
}

setlogged() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('logged', true);
}

getVisitingFlag() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool logged = prefs.getBool("logged") ?? false;
  if (logged) {
    Fluttertoast.showToast(
        msg: "getvisit true",
        backgroundColor: Colors.grey,
        fontSize: 25,
        gravity: ToastGravity.TOP,
        textColor: Colors.pink);
  } else {
    Fluttertoast.showToast(
        msg: "getvist false",
        backgroundColor: Colors.grey,
        fontSize: 25,
        gravity: ToastGravity.TOP,
        textColor: Colors.pink);
  }
  return logged;
}
