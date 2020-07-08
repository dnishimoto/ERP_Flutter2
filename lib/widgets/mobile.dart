import 'package:flutter/material.dart';
import 'appBar.dart';
import '../styles.dart';
import 'textSection.dart';

class MobileWidget extends StatelessWidget {
  const MobileWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: 
        
        Hero(tag:'mobile',
        child:
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              
              Center(child: 
               Container(padding: EdgeInsets.all(20.0) ,height:MediaQuery.of(context).size.width*.3, child: Image(image: AssetImage('/images/mobile.png'), fit:BoxFit.fitWidth)),
              ),
              Text("Mobile",style:Header3),
              TextSection("We build in flutter."),
         
        
                 ]))));
  }
}