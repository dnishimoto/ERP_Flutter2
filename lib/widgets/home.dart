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
        body: 

        Row(children: <Widget>[
          Container(padding: EdgeInsets.all(20.0) ,width:400, child: Image(image: AssetImage('/images/c_sharp.jpg'), fit:BoxFit.fitWidth)),
         
          Text("Software for all your needs") 

        ],)
        
        
    );
  }
}