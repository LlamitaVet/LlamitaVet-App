import 'package:flutter/material.dart';
import 'package:llamita_vet/screens/login.dart';

class Intro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('LlamitaVet'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'LlamitaVet',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Image(
                image: NetworkImage("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/228a-pom-2019.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=5efa2f5a374a9852f14b874acf299afe"),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Login();
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Login();
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}