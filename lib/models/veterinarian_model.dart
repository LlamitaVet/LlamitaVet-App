class VeterinarianModel {

  int? id;
  String? title;
  String? location;
  int? phone;
  String? img;
  List<String>? review;

  VeterinarianModel(this.id,
  this.title,
  this.location,
  this.phone,
  this.img,
  this.review
  );

  VeterinarianModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['name'];
    location = json['location'];
    phone = json['phone'];
    img = json['img_url'];
    if (json['review'] != null){
      review = (json['review'] as List<dynamic>).cast<String>();
    }

    //review = json['review'];
  }

  Map<String, dynamic> toMap(){
    return  {
      'id': id!,
      'name': title!
    };
  }

}