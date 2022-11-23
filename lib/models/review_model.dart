import 'dart:html';

class VeterinarianModel {

  int? id;
  String? review;
  int? veterinarian_id;

  VeterinarianModel(this.id,
      this.review,
      this.veterinarian_id
      );

  VeterinarianModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    review = json['email'];
    veterinarian_id = json['veterinarian_id'];
  }

  Map<String, dynamic> toMap(){
    return  {
      'id': id!,
      'email': review!,
      'veterinarian_id': veterinarian_id!
    };
  }
}