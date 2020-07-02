import 'package:flutter/material.dart';

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