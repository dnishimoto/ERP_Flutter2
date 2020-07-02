import 'package:flutter/material.dart';
import 'appBar.dart';
class AboutWidget extends StatelessWidget {
  const AboutWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: Text("About")
    );
  }
}