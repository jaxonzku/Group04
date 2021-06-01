import 'package:flutter/material.dart';
import 'package:college_App/pages/auth/login_page.dart';

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "To help Students connect to each other.To save trees, by decreasing the Paper used for Notice boardTo update student about the present things going in College as quick as possible To help Student with Digital Library",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: FloatingActionButton.extended(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false),
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Next')),
            ),
          )
        ],
      ),
    );
  }
}
