import 'package:flutter/material.dart';
import 'appBar.dart';
class ContactWidget extends StatelessWidget {
  const ContactWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: Text("Contact")
    );
  }
}