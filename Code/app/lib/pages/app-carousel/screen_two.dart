import 'package:college_App/constants.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          madebecause,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
