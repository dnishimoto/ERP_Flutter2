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
        primarySwatch: Colors.indigo,
      ),
      //home: LssFrontPageWidget(),
      home: MasterDetailContainer(),
      routes: <String, WidgetBuilder> {
    '/home': (BuildContext context) => new HomeWidget(),
    '/services': (BuildContext context) => new ServicesWidget(),
    '/guest': (BuildContext context) => new GuestWidget(),
    '/contact': (BuildContext context) => new ContactWidget(),
    '/about': (BuildContext context) => new AboutWidget(),
      }
    );
  }
}


const kTabletBreakpoint=720.0;
const kDesktopBreakpoint=1400.0;
const kSideMenuWidth=150;

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

            const kListViewWidth=150.0;
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
              leading: Icon(_menuItem.icon),
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
    switch(item.id)
    {
       case 1: return HomeWidget();
       case 2: return ServicesWidget();
       case 3: return ContactWidget();
       case 4: return GuestWidget();
       case 5: return AboutWidget();
    }
    return Text("failed to find Menu Item");
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
  final IconData icon;
  MenuItem(this.id,this.name,this.icon);
}
List<MenuItem> _menuItemData(){
  return[
    MenuItem(1,"Home",Icons.home),
    MenuItem(2,"Services",Icons.room_service),
    MenuItem(3,"Contact",Icons.contact_mail),
    MenuItem(4,"Guest",Icons.comment),
    MenuItem(5,"About",Icons.question_answer),
  ];
}