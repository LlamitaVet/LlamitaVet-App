import 'package:flutter/material.dart';

class DescriptionIntro extends StatelessWidget {

  String nameIntro;
  int stars;
  String descriptionIntro;

  DescriptionIntro(this.nameIntro, this.stars, this.descriptionIntro);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final title_stars = Row (
      children: <Widget>[
        Container (
          margin: EdgeInsets.only(
              top: 220.0,
              left: 30.0,
              right: 20.0
          ),

          child: Text(
            nameIntro,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

        ),
      ],
    );

    final description = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        descriptionIntro,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),

      ),
    );

    return Column(
      children: <Widget>[
        title_stars,
        description
      ],
    );


  }

}