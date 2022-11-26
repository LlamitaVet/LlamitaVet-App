import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:llamita_vet/models/veterinarian_model.dart';
import 'package:llamita_vet/screens/veterinarian_list.dart';
import 'package:llamita_vet/utils/base_api.dart';
import 'package:http/http.dart' as http;


class VeterinarianDetail extends StatelessWidget{
  final VeterinarianModel veterinarianModel;

  VeterinarianDetail(this.veterinarianModel, {super.key});
  final TextEditingController _controllerReview = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    String path;
    if (veterinarianModel.img != null) {
      path = veterinarianModel.img!;
    } else {
      path =
      "https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg";
    }

    double height = MediaQuery.of(context).size.height;

  final photo = Container(

    child: Image(
      image: NetworkImage(path),
    ),
  );

    final title = Padding(
      padding: EdgeInsets.only(
          bottom: 5.0,
        top: 15.0
      ),
      child: Text(
        veterinarianModel.title!,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
    );

    final contact_info = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
        veterinarianModel.location!,
        textAlign: TextAlign.center,
      ),
      Text(" • " + veterinarianModel.phone!.toString())
      ],
    );

    final description = Row(
      children: [
        Text("Ipsum lorem ashoqhqw dsa.", textAlign: TextAlign.left),
      ],
    );

    final space1 = Padding(
      padding: EdgeInsets.only(
          bottom: 25.0,
          top: 25.0
      ),
    );

    final review_title = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "Write a review",
        textAlign: TextAlign.center,
      ),
    );
    final review_text = TextFormField(
      controller: _controllerReview,
      decoration: new InputDecoration(
        labelText: "Write a review",
      ),
    );

    final btn_post = Padding(
      padding: EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {
          createReview();
          /*
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return VeterinarianList();
              },
            ),
          );
          */
        },
        child: Text('Post review'),
      ),
    );

    final reviews_title = Padding(
      padding: EdgeInsets.only(
          bottom: 5.0,
          top: 55.0
      ),
      child: Text(
        "Reviews",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
    );

    final reviews = Column(
      children: [
        if (veterinarianModel.review != null)
          for (int i = 0; i < veterinarianModel.review!.length; i++)
            Text(veterinarianModel.review![i], textAlign: TextAlign.left)
      ],
    );


    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(veterinarianModel.title!),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            photo,
            title,
            contact_info,
            space1,
            review_title,
            review_text,
            btn_post,
            reviews_title,
            reviews
          ],
        )
      ),
    );

  }
  createReview() async {
    var id = veterinarianModel.id;
    var name = veterinarianModel.title;
    var location = veterinarianModel.location;
    var phone = veterinarianModel.phone;
    var img_url = veterinarianModel.img;
    var review;
    if (veterinarianModel.review != null){
      review = veterinarianModel.review;
      review.add(_controllerReview.text);
    }
    else{
      review = _controllerReview.text;
    }

    print("Pan Bimbo");
    print(review);
    if (review.isNotEmpty) {
      String url = BASE_API + "veterinarians";
      var bodyData = json.encode({
        "id": id,
        "name": name,
        "location": location,
        "phone": phone,
        "img_url": img_url,
        "review": [review]
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