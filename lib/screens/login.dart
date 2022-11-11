import 'package:flutter/material.dart';
import 'package:llamita_vet/screens/veterinarian_list.dart';

class Login extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final title = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
      "Login",
      textAlign: TextAlign.center,
      ),
    );

    final email = TextFormField(
      decoration: new InputDecoration(
        labelText: "Enter email or username",
      ),
    );

    final password = TextFormField(
      decoration: new InputDecoration(
        labelText: "Enter password1",
      ),
    );

    final btn_summit = Padding(
      padding: EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: (
            ) {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context){
            return const VeterinarianList();
          },
          ),
          );
        },
        child: Text('Login'),
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
            email,
            password,
            btn_summit
          ],
        ),
      )
    );
  }

}