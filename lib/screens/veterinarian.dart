import 'package:flutter/material.dart';
import 'package:llamita_vet/models/veterinarian_model.dart';


/*
class Veterinarian extends StatelessWidget{

  late final VeterinarianModel veterinarianModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

  final photo = Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/img/veterinaria_rondon_1.jpg"),
        ),
      ),
    );

    final title = Padding(
      padding: EdgeInsets.only(
          bottom: 5.0
      ),
      child: Text(
        widget.veterinarianModel.title!,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
    );

    final contact_info = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
      veterinarianModel.location,
      textAlign: TextAlign.center,
      ),
      Text(" • " + veterinarianModel.phone)
      ],
    );


    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          photo,
          Padding(
            padding: EdgeInsets.only(
              left: 10.0,
            ),
            child: Container(
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title,
                  contact_info,
                ],
              ),
            ),
          )
        ],
      ),
    );

  }

}*/