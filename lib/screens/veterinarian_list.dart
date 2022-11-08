import 'package:flutter/material.dart';
import 'package:llamita_vet/utils/http_helper.dart';
import '../models/veterinarian_model.dart';


class VeterinarianList extends StatefulWidget{
  const VeterinarianList({super.key});

  @override
  State<VeterinarianList> createState() => _VeterinarianListState();
}

class _VeterinarianListState extends State<VeterinarianList> {

  List? veterinarians;
  HttpHelper? helper;

  @override
  void initState(){
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  Future initialize() async {
    veterinarians = List.empty();
    veterinarians = await helper?.getVeterinarians();
    setState(() {
      veterinarians = veterinarians;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemBuilder: ((context, index){
          return VeterinarianItem(veterinarians![index]);
        })
    );
  }
}

class VeterinarianItem extends StatefulWidget {

  final VeterinarianModel veterinarianModel;

  const VeterinarianItem(this.veterinarianModel, {super.key});

  @override
  State<VeterinarianItem> createState() => _VeterinarianItemState();

}

class _VeterinarianItemState  extends State<VeterinarianItem> {

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
/*
  final title = Padding(
    padding: EdgeInsets.only(
        bottom: 5.0
    ),
    child: Text(
      widget.veterinarianModel.title,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
    ),
  );

  final contact_info = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        widget.veterinarianModel.location,
        textAlign: TextAlign.center,
      ),
      Text(" • " + veterinarianModel.phone)
    ],
  );*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(widget.veterinarianModel.title!),
      ),
    );


    /*Padding(
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
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 5.0
                    ),
                    child: Text(
                      widget.veterinarianModel.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.veterinarianModel.location!,
                        textAlign: TextAlign.center,
                      ),
                      Text(" • " + widget.veterinarianModel.phone!)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );*/
  }

}