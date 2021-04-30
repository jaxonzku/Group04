import 'package:college_App/constants.dart';
import 'package:flutter/material.dart';
import 'package:college_App/StylesAndColors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class LibraryPage extends StatefulWidget {
  LibraryPage({Key key, this.openDrawerFunction}) : super(key: key);
  final VoidCallback openDrawerFunction;
  final url = library;

  @override
  createState() => LibraryPagest(this.url);
}

class LibraryPagest extends State<LibraryPage> {
  @override
  var _url;
  final _key = UniqueKey();
  LibraryPagest(this._url);
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
