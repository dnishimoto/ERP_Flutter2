import 'package:flutter/material.dart';
import 'appBar.dart';
//import 'dart:math';
import '../styles.dart';
import 'dart:math';
import 'businessSolutions.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);



  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with SingleTickerProviderStateMixin {

    
Animation<double> animation;
  AnimationController controller;
  //AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //animationController = AnimationController(vsync: this, duration: Duration(seconds: 5), upperBound: pi * 2);

    controller=AnimationController(duration: const Duration(seconds: 5), vsync: this);

    animation = Tween<double>(begin: 0, end: 600).animate(controller)..addListener(() {            
    setState(() { }); 
    });      
     //animation = CurvedAnimation(  parent: controller,  curve: Curves.easeIn,  reverseCurve: Curves.easeOut,);
    controller.forward();

    //animationController.forward();

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
          SingleChildScrollView(child: 
          Container(height: 1800,child:
          Stack(
            children:[
            AnimatedPositioned(
              duration: Duration(microseconds: 500),
              top:600-animation.value,
              left:600-animation.value,
              child:Card(child:Container(padding: EdgeInsets.all(20.0) ,width:400, child: Image(image: AssetImage('/images/c_sharp.jpg'), fit:BoxFit.fitWidth))
              //FlatButton(onPressed: (){},color: Colors.red,child:Text(""),)
              ,
            ))
           ,AnimatedPositioned(
             duration: Duration(microseconds: 5000),
             left:450, top:-450+animation.value, child:Text("Meeting all your business needs",style:CustomImageFont))
          ,
          Positioned
          (
            top:450.0*(600/animation.value),
            left:0,
            child:

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Business Solutions"),
              Text("Are you needing to create reports for your customers?"),
              Text("Extract"),
              Text("Transform your data into SQL server. "),
              Text("Build"),
              Text("Reports to answer business questions. ")
                            ],)
            
            ),
  
          Positioned(
            top:300.0,
            left:400.0,
            child:
          RotationTransition(
             turns: Tween(begin: 0.0, end: 1.0).animate(controller),
            
            child: 
            Hero(tag:'businessSolutions', child:
            Container(padding: EdgeInsets.all(20.0) ,width:400, child: 
            FlatButton(
              onPressed: (){
              Navigator.of(context).pushNamed("/businessSolutions");
            },child:
              Image(image: AssetImage('/images/dashboard.png'), fit:BoxFit.fitWidth))))
          ,)
          ),

          AnimatedPositioned(
              duration: Duration(microseconds: 500),
              top:100+animation.value,
              left:0,
              child:
              Hero(tag:'mobile', child:
            Container(padding: EdgeInsets.all(20.0) ,width:400, child: 
            FlatButton(
              //color:Colors.red,
              onPressed: (){
              Navigator.of(context).pushNamed("/mobile");
            },child:
              Container(padding: EdgeInsets.all(20.0) ,width:400, child: Image(image: AssetImage('/images/mobile.png'), fit:BoxFit.fitWidth))
              //
              ,
            ))))
           ,AnimatedPositioned(
             duration: Duration(microseconds: 5000),
              top:800* (600/animation.value), 
              left:450, child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                Text("Web & Mobile"),
                Text("Interested in a Web and Mobile app"),
                Text("Flutter for business")

              ])
              )
          ,
          Positioned(
            left:0.0,
            top:1150.0,
            child: Container(width:400.0,child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("About"),
                Text("My name is David Nishimoto and for over 20 years, I have designed and developed software and web applications for companies like Blue Cross of Idaho, GE Capital, American Express, ReviewJump, a billion dollar Sugar company, Family Search, and e-commerce."),
          ])),),


          Positioned(
            left:450.0,
            top:1000.0,
            child: 
             Hero(tag:'about', child:
            Container(padding: EdgeInsets.all(20.0) ,width:400, child: 
            FlatButton(
              //color:Colors.red,
              onPressed: (){
              Navigator.of(context).pushNamed("/about");
            },child:
            Container(padding: EdgeInsets.all(20.0) ,width:400, child: Image(image: AssetImage('/images/david.gif'), fit:BoxFit.fitWidth))
          )))),
          
          Positioned(
            left:0.0,
            top:1400.0,
            child:
            
            Card(child:Container(
              width: 850,
            padding: EdgeInsets.all(20.0) , child: Image(image: AssetImage('/images/boise.jpg'), fit:BoxFit.fitWidth))
          ))

          ]
          ),),),
         

         
        
        
    );
  }
}