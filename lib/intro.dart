import 'package:flutter/material.dart';

class Intro extends StatelessWidget {

  String introTitle;
  String descriptionVeterinary;

  Intro(this.introTitle, this.descriptionVeterinary);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    final description = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        descriptionVeterinary,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),

      ),
    );

    return Column(
      children: <Widget>[
        description
      ],
    );


  }

}