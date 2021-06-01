import 'package:flutter/material.dart';
import 'package:college_App/StylesAndColors.dart';
import 'package:college_App/pages/app/app_state.dart';
import 'package:college_App/pages/app/developer/developer_page.dart';
import 'package:college_App/constants.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  ScrollController _scrollController;
  AppState appState;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appState = AppState.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(collegename),
              background: Image.asset(
                'assets/images/college.jpg',
                fit: BoxFit.cover,
                color: Colors.black26,
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                _infoCard(),
                _whyMyApPCard(),
                _madeBecause(),
                _gotoDevelopers(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _gotoDevelopers() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RaisedButton(
        onPressed: () {
          _sendTo(DeveloperPage());
        },
        shape: StadiumBorder(),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Know about the Developers',
          style: textStyle.copyWith(color: Theme.of(context).accentColor),
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _madeBecause() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Made because...',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6.0),
              _bulletPoint(madebecause)
            ],
          ),
        ),
      ),
    );
  }

  Widget _whyMyApPCard() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Why ' + appname + '?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6.0),
              _bulletPoint('To help Students connect to each other'),
              _bulletPoint(
                  'To save trees, by decreasing the Paper used for Notice board'),
              _bulletPoint(
                  'To update student about the present things going in College as quick as possible.'),
              _bulletPoint('To help Student with Digital Library.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            about,
            style: TextStyle(height: 1.2, fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  Widget _bulletPoint(String msg) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.chevron_right),
      title: Text(
        msg,
        style: textStyle.copyWith(height: 1.1),
      ),
    );
  }

  void _sendTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppState(
          firebaseUser: appState.firebaseUser,
          user: appState.user,
          isDarkThemeEnabled: appState.isDarkThemeEnabled,
          changeTheme: appState.changeTheme,
          child: page,
        ),
      ),
    );
  }
}
