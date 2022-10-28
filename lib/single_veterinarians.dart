import 'package:flutter/material.dart';

class SingleVeterinarians extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final photo = Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/img/veterinaria_rondon_1.jpg")
        )
      ),
    );

    final title = Padding(
      padding: EdgeInsets.only(
          top: 20.0
      ),
      child: Text(
        "Pet's House",
        textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
    );

    final contact_info = Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "12345",
              textAlign: TextAlign.center,
            ),
            Text(" • hola")
          ],
      ),
    );

    return Column(

      children: [
        photo,
        title,
        contact_info
      ],
    );

  }
  
}