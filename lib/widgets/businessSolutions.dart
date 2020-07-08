import 'package:flutter/material.dart';
import 'appBar.dart';
import '../styles.dart';
import 'textSection.dart';

class BusinessSolutionWidget extends StatelessWidget {
  const BusinessSolutionWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar(),
        backgroundColor: Colors.white,
        body: 
        
        Hero(tag:'businessSolutions',
        child:
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              
              Center(child: 
               Container(padding: EdgeInsets.all(20.0) ,height:MediaQuery.of(context).size.width*.3, child: Image(image: AssetImage('/images/dashboard.png'), fit:BoxFit.fitWidth)),
              ),
              Text("Business Solutions",style:Header3),
              TextSection("We use Microsoft sql server and powershell to load your data for online analytical reporting.  We transform your data by using existing schema relationship into data marts representing the schema of the original system. We can make inquiries about the data to answer business questions. "),
              TextSection("Every day your company is accumulating more and more data. Our company helps you build dashboards, reports and interactive queries too visually understand your data. "),        
              TextSection("It is all about perspective. Online analytics have been big business tools that now, can be used by small business to improve or create processes like big business behavior and culture. Analyzing the data is non technical as we use products like powerbi and Microsoft Ssrs as tools too present data results. These tools aggregate the data, allowing for complex equations and bring together multiple data sources into one location. "),
              TextSection("In short, I hope you chose us as small business owners to build a business intelligence platform that will grow with your company. Let us grow your company into the 21 century. "),
        
                 ]))));
  }
}