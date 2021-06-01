import 'package:flutter/material.dart';
import 'package:college_App/pages/app/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:college_App/pages/app/developer/dev_grid_page.dart';
//import 'package:college_App/pages/app/developer/developer_class.dart';
import './card.dart' show DeveloperCard;

class DeveloperPage extends StatefulWidget {
  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  AppState appState;
  //List<Developer> developers;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    appState = AppState.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Developers"),
        actions: <Widget>[],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: isLandscape ? 3 : 2,
          children: developerCards,
        ),
      ),
    );
  }
}

final developerCards = <Widget>[
  DeveloperCard(
      name: "Jackson James",
      business: "Python and Flutter",
      image: AssetImage('assets/images/jack.jpg')),
  DeveloperCard(
      name: "Divya Peter",
      business: "Web and flutter",
      image: AssetImage('assets/images/divya.jpg')),
  DeveloperCard(
    name: "ELjo Joy",
    business: "Design and php",
    image: AssetImage('assets/images/eljo.jpeg'),
  ),
  DeveloperCard(
      name: "Akash Kumar",
      business: "Design and php",
      image: AssetImage('assets/images/akash.jpg')),
  DeveloperCard(
    name: "Shaiju Paul",
    business: "Guide",
    image: AssetImage('assets/images/shaiju.jpeg'),
  ),
];
