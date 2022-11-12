import 'package:flutter/material.dart';
import 'package:llamita_vet/screens/veterinarian_list.dart';
import 'package:llamita_vet/screens/veterinarian_detail.dart';

class VeterinarianReview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final title = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "Review",
        textAlign: TextAlign.center,
      ),
    );

    final review = TextFormField(
      decoration: new InputDecoration(
        labelText: "Write a review",
      ),
    );

    final btn_post = Padding(
      padding: EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: (
            ) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return VeterinarianList();
              },
            ),
          );
        },
        child: Text('Post review'),
      ),
    );

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              title,
              review,
              btn_post
            ],
          ),
        )
    );
  }

}