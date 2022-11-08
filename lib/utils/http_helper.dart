import 'dart:convert';


import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:llamita_vet/models/veterinarian_model.dart';


class HttpHelper {

  final String urlBase = 'https://llamitavetapi.rj.r.appspot.com/veterinarians';

  Future<List?> getVeterinarians() async {
    http.Response result = await http.get(Uri.parse(urlBase));



    if(result.statusCode == HttpStatus.ok){
      final jsonResponse = jsonDecode(result.body);
    final veterinariansMap = jsonResponse;
      List<VeterinarianModel> veterinarians  = veterinariansMap.map((i) => VeterinarianModel.fromJson(i)).toList();

      return veterinarians;

    } else{
      return null;

    }
  }

}