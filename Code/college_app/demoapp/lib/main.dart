import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.red,
      canvasColor: Colors.amberAccent,
    ),
    home: runAppa(),
  ));
}

class runAppa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CollegeApp"),
      ),
      body: Center(
          child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Text("inp1"),
          Spacer(
            flex: 2,
          ),
          Text("inp2"),
          Spacer(
            flex: 2,
          ),
          Text("inp3"),
          Spacer(
            flex: 2,
          ),
        ],
      )),
    );
  }
}
