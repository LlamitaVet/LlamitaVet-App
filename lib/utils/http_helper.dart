import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:llamita_vet/models/veterinarian_model.dart';


class HttpHelper {

  final String urlBase = 'https://llamitavetapi.rj.r.appspot.com/veterinarians';

  Future<List?> getVeterinarians() async {
    final String url = urlBase;
    http.Response result = await http.get(Uri.parse(url));

    if(result.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(result.body);
    final veterinariansMap = jsonResponse;
      List veterinarians  = veterinariansMap.map((i) => VeterinarianModel.fromJson(i)).toList();


      print(result.body);
      return veterinarians;

    } else{
      print("falloo");
      throw Exception("Fallo conexión");

    }
  }

}