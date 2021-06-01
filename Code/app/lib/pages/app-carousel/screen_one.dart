import 'package:college_App/constants.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          about,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
