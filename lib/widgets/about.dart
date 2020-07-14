import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'appBar.dart';
import '../styles.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key key}) : super(key: key);

Widget _buildCard(String data)
{

  return Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(5.0),
             ),
            margin: EdgeInsets.all(10.0),
            color: Colors.green[100],
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Html(data:data),
            ]));
}
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: 
        

//Container(
  //width:MediaQuery.of(context).size.width,
//child:
      Column(

         //crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Flexible(
            fit: FlexFit.loose,
            child: 
        Hero(tag:'about',
          child: 
              //Center(child: 
               Container(
                 padding: EdgeInsets.all(10.0) ,
               constraints:BoxConstraints(
               // minWidth:MediaQuery.of(context).size.width*.6
               minHeight: 400,
               minWidth: 400,
               maxHeight: 800,
               maxWidth: 800,
              ),
              decoration: BoxDecoration(border: Border.all(color:Colors.black, width:1.0)
              //,color:Colors.yellow
              ),
               //width:MediaQuery.of(context).size.width*.6, 
               //height: MediaQuery.of(context).size.height,
               child: Image(image: AssetImage('/images/david.gif'), fit:BoxFit.fitWidth)
               // child: Text("test")
               ),
              
              ),
                ),
                
               //),
      //)
        


      Flexible(
        fit: FlexFit.tight,
        child:
        Container(
           constraints:BoxConstraints(maxWidth:MediaQuery.of(context).size.width),
          child:
         

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        SizedBox(),
      SizedBox( width:400,
        child:Text("David Nishimoto has over 20 years developing software. He designed and developed software and web applications for companies like Blue Cross of Idaho, GE Capital, American Express, LDS Church, Department of Defense, a billion dollar Sugar company, Family Search, and e-commerce. He now develops software for a near billion dollar construction company."
        )),
        SizedBox(),
        ],)

        )
      )


      ,Text("Skills",style: Header3,)
      , 
      
      //SingleChildScrollView(
       // scrollDirection: Axis.horizontal,
     
        Expanded(child:ListView(children: [
          _buildCard("<h3>Microsoft Sql</h3> <p>Tsql knowledge of stored procedures, table functions, aggregate functions. knowlege or SSMS, table schemas : indexes and performance tuning.</p>")
            
          ,_buildCard("<h3>Building Datamarts</h3> I know how to build surrogate keys and stage and clean data for deployment to production using powershell and sql.  I practice the Kimball methodology of reset and reload partial datasets.")
            ,_buildCard("<h3>C#</h3> Knowledgable about writing C# api for web api.  Knowledge in calling stored from linq.  Knowledge in several object oriented patterns, such as, builder pattern, pooling pattern, observable pattern, and unit of work.")
            ,_buildCard("<h3>Flutter</h3> Knowledge in writing flutter applications for web and mobile.  Knowlege of widget application development.")
            ],
            )
            )
 

        ],)
);
}
}