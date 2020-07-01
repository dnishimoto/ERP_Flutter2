import 'package:flutter/material.dart';
import 'widgets/home.dart';
import 'widgets/about.dart';
import 'widgets/contact.dart';
import 'widgets/guest.dart';
import 'widgets/services.dart';

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
      //home: LssFrontPageWidget(),
      home: MasterDetailContainer(),
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

          new Image(image: AssetImage('assets/images/logo.png')),
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
              onPressed: (){
                
                
            //Navigator.push(context, MaterialPageRoute( builder: (context) => DetailPage())); },
                 widget.navigateToServices(context);},
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

class MasterDetailContainer extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width:  MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: MasterPage())
          ],
        ));
  }

}
const kTabletBreakpoint=720.0;
const kDesktopBreakpoint=1400.0;
const kSideMenuWidth=200;

class MasterPage extends StatefulWidget {
  @override
  MasterPageState createState() => MasterPageState();
}
class MasterPageState extends State<MasterPage> {
  final _menuItems = _menuItemData();

  MenuItem selectedItem;
  final _selection = ValueNotifier<MenuItem>(null);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context,dimens){
          if(dimens.maxWidth>=kTabletBreakpoint){

            const kListViewWidth=300.0;
            return Row(
              children:<Widget>[
                Container(
                  width:kListViewWidth,
                  child: buildListView((val){
                    _selection.value=val;
                  })
                ),
                VerticalDivider(width:0),
                Expanded(
                  child:ValueListenableBuilder<MenuItem>(
                      valueListenable: _selection,
                      builder: (context,menuItem, child){
                        if(menuItem==null)
                        {
                          return HomeWidget();
                        }
                        return ItemDetails(item: menuItem);
                      }
                  )
                )
              ]
            );
          }
          return buildListView((val){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:(_) => ItemDetails(item:val)
              ),
            );
          });

    });
  }    
    Widget buildListView(ValueChanged<MenuItem> onSelect)
    {
      return Scaffold(
        appBar: AppBar(
          centerTitle:false,
          title: Text("Menu"),
        ),
        body: ListView.separated(
          separatorBuilder: (context,index)=> Divider(height:0)
          , itemCount: _menuItems.length, 
          itemBuilder: (context,index){
            final _menuItem= _menuItems[index];
            return ListTile(
              leading: Icon(Icons.menu),
              title: Text(_menuItem.name),
              onTap:() =>onSelect(_menuItem),
            );
          },)

      );
    }
    
}
    
    
   

class ItemDetails extends StatelessWidget {
  ItemDetails({@required this.item});
  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item.name,
          style: textTheme.headline,
        ),
        
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(child: content),
    );
  }
}
class DetailPage extends StatelessWidget {
  //DetailPage({Key key, this.item}) : super(key: key);
  DetailPage(this.item);
  final String item;
  @override

  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: <Widget>[Text("hello world")],
      ),
    );

  }

}
class DetailRoute<T> extends TransitionRoute<T> with LocalHistoryRoute<T> {

   bool opaque;
   Duration transitionDuration;

  DetailRoute({@required this.builder, RouteSettings settings})

      : super(settings: settings);

  final WidgetBuilder builder;

  @override

  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(builder: (context) {
        return Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: builder(context)
            ));
      })
    ];

  }

}

class MenuItem
{
  final int id;
  final String name;
  MenuItem(this.id,this.name);
}
List<MenuItem> _menuItemData(){
  return[
    MenuItem(1,"Home"),
    MenuItem(2,"Services"),
    MenuItem(3,"Contact"),
    MenuItem(4,"Guest"),
  ];
}