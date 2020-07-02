import 'package:flutter/material.dart';
import 'appBar.dart';
class GuestWidget extends StatelessWidget {
  const GuestWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: Text("Guest")
    );
  }
}