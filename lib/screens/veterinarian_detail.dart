import 'package:flutter/material.dart';
import 'package:llamita_vet/models/veterinarian_model.dart';
import 'package:llamita_vet/screens/veterinarian_review.dart';



class VeterinarianDetail extends StatelessWidget{

  final VeterinarianModel veterinarianModel;

  const VeterinarianDetail(this.veterinarianModel, {super.key});

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

    final btn_review = Padding(
      padding: EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: (
            ) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return VeterinarianReview();
              },
            ),
          );
        },
        child: Text('Create review'),
      ),
    );

    final reviews_title = Padding(
      padding: EdgeInsets.only(
          bottom: 5.0,
          top: 15.0
      ),
      child: Text(
        "Reviews",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
    );

    final reviews = Column(
      children: [
        Text(veterinarianModel.review!, textAlign: TextAlign.left)
      ],
    );


    return Scaffold(
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
            description,
            btn_review,
            reviews_title,
            reviews
          ],
        )
      ),
    );

  }

}