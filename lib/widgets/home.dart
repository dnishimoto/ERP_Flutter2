import 'package:flutter/material.dart';
import 'appBar.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: Text("Home2")
    );
  }
}