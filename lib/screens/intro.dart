import 'package:flutter/material.dart';
import 'package:llamita_vet/screens/login.dart';

class Intro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final title = Padding(
      padding: EdgeInsets.all(0.0),
      child: Text(
        "LlamitaVet",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)
      ),
    );

    final btn_register = Padding(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: (
            ) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return Login();
              },
            ),
          );
        },
        child: Text('Sign up'),
      ),
    );

    final btn_login = Padding(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: (
            ) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return Login();
              },
            ),
          );
        },
        child: Text('Sign in'),
      ),
    );

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              title,
              btn_register,
              btn_login
            ],
          ),
        )
    );
  }

}