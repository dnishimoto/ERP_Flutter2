import 'package:flutter/material.dart';
import 'appBar.dart';
import '../styles.dart';
import 'textSection.dart';

class MobileWidget extends StatefulWidget {
  MobileWidget({Key key}) : super(key: key);



  @override
  _MobileWidgetState createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget> {
  @override
Widget build(BuildContext context) {

  var _crossAxisSpacing = 8;
var _screenWidth = MediaQuery.of(context).size.width;
var _crossAxisCount = 3;
var _width = ( _screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
var cellHeight = 300;
var _aspectRatio = _width /cellHeight;
    
    return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: 
        
//Container(
  //width:MediaQuery.of(context).size.width,
//child:

      Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: 
       SizedBox(
         width: MediaQuery.of(context).size.width,
         child: 
        Hero(tag:'mobile',
          child: 
              Center(child: 
               Container(padding: EdgeInsets.all(20.0) ,height:MediaQuery.of(context).size.width*.6, child: Image(image: AssetImage('/images/mobile.png'), fit:BoxFit.fitWidth)),
              ),
                )
                )
      )
      ,
      Text("Mobile",style:Header3),
      Expanded(child:
      GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: _aspectRatio,
        crossAxisCount: _crossAxisCount
        ,children:[
                GridTile(
                  header:GridTileBar(
                  title:Text("Single Code base"),
                  backgroundColor: Colors.grey,
                  ),
                  child:
                  Column( 
                  children:[
                  SizedBox(height: 50.0,),
                   Text("Flutter converts dart code into native ios and android code.")
                  ])
                ),
                 GridTile(
                   header:GridTileBar(
                   title: Text("Lower costs for Startups"),
                  backgroundColor: Colors.grey,
                ),
                  child:
                   Column( 
                  children:[
                  SizedBox(height: 50.0,),
                  Expanded(child:Text("Get your idea created fast by using one code base for web, ios, and android. Rapid application development makes flutter a great choice.  Flutter provides a single code base that works flawlessly on multiple platforms.")
                   )])
                ),
                GridTile(header:GridTileBar(
                  title: Text("Backed by Google"),
                  backgroundColor: Colors.grey,
                ),
                  child:
                   Column( 
                  children:[
                  SizedBox(height: 50.0,),
                  Expanded(child:Text("Google is investing in flutter creating a rich set of functionality.  At the heart of flutter are widgets.  Widgets provide the look and feel that users are familar with and expect.")
                   )])               
                )
                
              ]))

],)

                
         
                );

              
  }
}
