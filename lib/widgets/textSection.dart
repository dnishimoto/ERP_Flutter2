import 'package:flutter/material.dart';
import '../styles.dart';


class TextSection extends StatelessWidget {
  const TextSection(this._body);
  static const double _hPad=16.0;
  final String _body;

  @override
  Widget build(BuildContext context) {
    return Column(children: 
    [
      Container(
        padding:const EdgeInsets.fromLTRB(_hPad,10.0,_hPad,16),
        child:Text(_body,style:MediumStyle)
        )
    ],
    );
  }
}