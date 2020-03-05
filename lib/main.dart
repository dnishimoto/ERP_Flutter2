import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listen Software Solutions',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LssFrontPageWidget(),
      routes: <String, WidgetBuilder> {
    '/services': (BuildContext context) => new ServicesWidget(),
    '/guest': (BuildContext context) => new GuestWidget(),
    '/contact': (BuildContext context) => new ContactWidget(),
    '/about': (BuildContext context) => new AboutWidget(),
      }
    );
  }
}

class News{
  final String key;
  final String value;

  News({this.key,this.value});

/*
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      key: json['key'],
      value: json['value']
    );
  }
  */

}

class NewsCard extends StatelessWidget {
 
  NewsCard(this._news);

  final News _news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Card(
        child:Padding(
          padding:EdgeInsets.all(20.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:20.0,bottom:20.0),
                child: Text("${_news.value}",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
              )

            ],
          )
        )
      ),
    );
  }
}


class LssFrontPageWidget extends StatefulWidget {
  LssFrontPageWidget({Key key}) : super(key: key);

  void navigateToServices(BuildContext context){ Navigator.of(context).pushNamed('/services');}
  void navigateToGuest(BuildContext context){ Navigator.of(context).pushNamed('/guest');}
  void navigateToContact(BuildContext context){ Navigator.of(context).pushNamed('/contact');}
  void navigateToAbout(BuildContext context){ Navigator.of(context).pushNamed('/about');}

  @override
  _LssFrontPageWidgetState createState() => _LssFrontPageWidgetState();
}

class _LssFrontPageWidgetState extends State<LssFrontPageWidget> {
  
  @override
  Widget build(BuildContext context) {
    
  return Scaffold(

        appBar: new AppBar(
          backgroundColor:Colors.blue,
          title: 
          //new Text("Listen Software Solutions2"),
          //Image.asset('/images/logo.png'),

          new Image(image: AssetImage('images/logo.png')),
          actions: <Widget>[
              IconButton(icon:Icon(Icons.add),
              onPressed: (){debugPrint("Add was pressed");})

          ]

        ),
        backgroundColor: Colors.lightBlue,
        body: new Center(child:new Column(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>
        [
          new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:  AssetImage('images/marquee-1.jpg'),
              fit: BoxFit.cover,
          ))),
         
          new Text("Listen Software Solutions"),
        
        ])),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index){ debugPrint("you tapped index=$index");},
          items:[
            BottomNavigationBarItem(icon:new Icon(Icons.home),title: new Text("Home")),
            BottomNavigationBarItem(icon:new Icon(Icons.email),title: new Text("Contact"))
          ]
        ),
        drawer: Drawer(
          child: ListView(children:<Widget>[
              Row(children:<Widget>[
                IconButton (
              onPressed: (){ debugPrint("press item 2");},
              icon:Icon(Icons.event),
              
            ),
            Text("Home")
            ]),
 Row(children:<Widget>[
                IconButton (
              onPressed: (){ widget.navigateToServices(context);},
              icon:Icon(Icons.dashboard),
              
            ),
            Text("Services")
            ]),

             Row(children:<Widget>[
                IconButton (
              onPressed: (){ widget.navigateToGuest(context);},
              icon:Icon(Icons.group),
              
            ),
            Text("Guest")
            ]),

             Row(children:<Widget>[
                IconButton (
              onPressed: (){ widget.navigateToContact(context);},
              icon:Icon(Icons.email),
              
            ),
            Text("Contact")
            ]),

             Row(children:<Widget>[
                IconButton (
              onPressed: (){ widget.navigateToAbout(context);},
              icon:Icon(Icons.question_answer),
              
            ),
            Text("About")
            ]),

          ]),
          ),
          
        

    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Contact"),
    );
  }
}
class GuestWidget extends StatelessWidget {
  const GuestWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Guest"),
    );
  }
}
class AboutWidget extends StatelessWidget {
  const AboutWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("About"),
    );
  }
}
class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Services")
    );
  }
}