import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:llamita_vet/screens/login.dart';
import 'package:llamita_vet/models/veterinarian_model.dart';
import 'package:llamita_vet/screens/single_veterinarians.dart';
import 'package:llamita_vet/screens/veterinarian_detail.dart';
import 'package:http/http.dart' as http;
import 'package:llamita_vet/screens/veterinarian_list.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LlamitaVet App",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const VeterinarianList();
  }
}
