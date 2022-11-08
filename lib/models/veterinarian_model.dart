class VeterinarianModel {

  int? id;
  String? img;
  String? title;
  String? location;
  String? phone;

  VeterinarianModel(id, img, title, location, phone) {
    this.id = id;
    this.img = img;
    this.title = title;
    this.location = location;
    this.phone = phone;
  }

  VeterinarianModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    img = json['img_url'];
    title = json['title'];
    location = json['location'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap(){
    return  {
      'id': id!,
      'img': img!,
      'title': title!,
      'location': location!,
      'phone': phone!
    };
  }

}