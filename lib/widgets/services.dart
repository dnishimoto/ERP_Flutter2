import 'package:flutter/material.dart';
import 'appBar.dart';
class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: Text("Services")
    );
  }
}