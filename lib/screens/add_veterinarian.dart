import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:llamita_vet/screens/veterinarian_list.dart';
import 'package:llamita_vet/utils/base_api.dart';
import 'package:http/http.dart' as http;

class AddVeteninarian extends StatefulWidget {
  const AddVeteninarian({super.key});
  @override
  State<AddVeteninarian> createState() => _AddVeteninarianState();
}

class _AddVeteninarianState extends State<AddVeteninarian> {
  final TextEditingController _controllerName = new TextEditingController();
  final TextEditingController _controllerLocation = new TextEditingController();
  final TextEditingController _controllerPhone = new TextEditingController();
  final TextEditingController _controllerImg = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Veterinarian"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.all(30),
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: _controllerName,
          decoration: InputDecoration(
            hintText: "Name",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: _controllerLocation,
          decoration: InputDecoration(
            hintText: "Location",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: _controllerPhone,
          decoration: InputDecoration(
            hintText: "Phone",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: _controllerImg,
          decoration: InputDecoration(
            hintText: "Image URL",
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
            onPressed: () {
              createNewVeterinarian();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const VeterinarianList();
                }),
              );
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

  createNewVeterinarian() async {
    var name = _controllerName.text;
    var location = _controllerLocation.text;
    var phone = _controllerPhone.text;
    var img_url = _controllerImg.text;
    if (name.isNotEmpty &&
        location.isNotEmpty &&
        phone.isNotEmpty &&
        img_url.isNotEmpty) {
      String url = BASE_API + "veterinarians";
      var bodyData = json.encode({
        "name": name,
        "location": location,
        "phone": phone,
        "img_url": img_url,
      });
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: bodyData);
      print(response.statusCode);
      print(response.body);
    }
  }
}
