import 'package:flutter/material.dart';
import 'appBar.dart';
//import 'dart:math';
import '../styles.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);



  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with SingleTickerProviderStateMixin {

    
Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(duration: const Duration(seconds: 5), vsync: this);

    animation = Tween<double>(begin: 0, end: 600).animate(controller)..addListener(() {            
    setState(() { }); 
    });      
     //animation = CurvedAnimation(  parent: controller,  curve: Curves.easeIn,  reverseCurve: Curves.easeOut,);
    controller.forward();

    //animation=controller.drive(  CurveTween(curve: Curves.ease),);
  }
 void dispose()
 {
    controller.dispose();            
    super.dispose();        
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: 

        
          Stack(
            children:[
            AnimatedPositioned(
              duration: Duration(microseconds: 500),
              top:600-animation.value,
              left:600-animation.value,
              child:Container(padding: EdgeInsets.all(20.0) ,width:400, child: Image(image: AssetImage('/images/c_sharp.jpg'), fit:BoxFit.fitWidth))
              //FlatButton(onPressed: (){},color: Colors.red,child:Text(""),)
              ,
            )
           ,AnimatedPositioned(
             duration: Duration(microseconds: 5000),
             left:450, top:-450+animation.value, child:Text("Meeting all your business needs",style:CustomImageFont))
          ]
          ),
         

         
        
        
    );
  }
}