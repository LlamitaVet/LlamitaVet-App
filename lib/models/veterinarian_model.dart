class VeterinarianModel {

  int? id;
  String? title;
  String? location;
  int? phone;
  String? img;

  VeterinarianModel(this.id,
  this.title,
  this.location,
  this.phone,
  this.img
  );

  VeterinarianModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['name'];
    location = json['location'];
    phone = json['phone'];
    img = json['img_url'];
  }

  Map<String, dynamic> toMap(){
    return  {
      'id': id!,
      'name': title!
    };
  }

}