import 'package:flutter/material.dart';
import 'appBar.dart';
import '../styles.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key key}) : super(key: key);

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
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: 
       SizedBox(
         width: MediaQuery.of(context).size.width,
         child: 
        Hero(tag:'about',
          child: 
              Center(child: 
               Container(padding: EdgeInsets.all(20.0) ,height:MediaQuery.of(context).size.width*.6, child: Image(image: AssetImage('/images/david.gif'), fit:BoxFit.fitWidth)),
              ),
                )
                )
      )
      ,
      Text("About",style:Header3),
      Row(children: [
        SizedBox(width:(MediaQuery.of(context).size.width/2) - 200),
      SizedBox( width: 400,
        child:Text("David Nishimoto has over 20 years developing software. He designed and developed software and web applications for companies like Blue Cross of Idaho, GE Capital, American Express, LDS Church, Department of Defense, a billion dollar Sugar company, Family Search, and e-commerce. He now develops software for a near billion dollar construction company."
        )),
        SizedBox(width:(MediaQuery.of(context).size.width/2) - 200),
        ],)

    
      ,Expanded(child:  
      ListView(
        children: [
          Card(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Skills",style: Header2,),
            Html(data:"<h3>Microsoft Sql</h3> <p>Tsql knowledge of stored procedures, table functions, aggregate functions. knowlege or SSMS, table schemas : indexes and performance tuning.</p>"),
            Html(data:"<h3>Building Datamarts</h3> I know how to build surrogate keys and stage and clean data for deployment to production using powershell and sql.  I practice the Kimball methodology of reset and reload partial datasets.")
            ,Html(data:"<h3>C#</h3> Knowledgable about writing C# api for web api.  Knowledge in calling stored from linq.  Knowledge in several object oriented patterns, such as, builder pattern, pooling pattern, observable pattern, and unit of work.")
            ],
            ))
        ],))
 
        ],)
     // )
      );
}
}