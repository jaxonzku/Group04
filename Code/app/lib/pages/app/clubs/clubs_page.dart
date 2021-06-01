import 'package:college_App/constants.dart';
import 'package:flutter/material.dart';
import 'package:college_App/StylesAndColors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class ClubsPage extends StatefulWidget {
  ClubsPage({Key key, this.openDrawerFunction}) : super(key: key);

  final VoidCallback openDrawerFunction;
  final url = collegeweb;

  @override
  createState() => _ClubsPageState(this.url);
}

class _ClubsPageState extends State<ClubsPage> {
  @override
  var _url;
  final _key = UniqueKey();
  _ClubsPageState(this._url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url))
          ],
        ));
  }
}
