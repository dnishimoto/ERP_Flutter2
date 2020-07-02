import 'package:flutter/material.dart';

Widget setAppBar() {
  return new AppBar(
          backgroundColor:Colors.indigo,
          title: 
          Image(image: AssetImage('/images/logo.png')),
          // FittedBox(fit: BoxFit.fill, child: Image(image: AssetImage('/images/logo.png'))),
          actions: <Widget>[
              IconButton(icon:Icon(Icons.add),
              onPressed: (){debugPrint("Add was pressed");}
              )]);
}

