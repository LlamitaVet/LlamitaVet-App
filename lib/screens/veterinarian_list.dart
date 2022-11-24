import 'package:flutter/material.dart';
import 'package:llamita_vet/screens/veterinarian_detail.dart';
import 'package:llamita_vet/utils/db_helper.dart';
import 'package:llamita_vet/utils/http_helper.dart';
import '../models/veterinarian_model.dart';


class VeterinarianList extends StatefulWidget{
  const VeterinarianList({super.key});

  @override
  State<VeterinarianList> createState() => _VeterinarianListState();
}

class _VeterinarianListState extends State<VeterinarianList> {
  int? veterinariansCount;
  List? veterinarians;
  HttpHelper? helper;


  @override
  void initState(){
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  Future initialize() async {
    veterinarians = List.empty();
    veterinarians = await helper?.getVeterinarians();
    setState(() {
      veterinariansCount = veterinarians?.length;
      veterinarians = veterinarians;
    });
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Veterinarians"),
      ),
      body: ListView.builder(
          itemCount: (veterinariansCount == null) ? 0 : veterinariansCount,
          itemBuilder: ((context, index){

              return VeterinarianItem(veterinarians![index]);

          })
      ),
    );
  }
}

class VeterinarianItem extends StatefulWidget {

  final VeterinarianModel veterinarianModel;

  const VeterinarianItem(this.veterinarianModel, {super.key});

  @override
  State<VeterinarianItem> createState() => _VeterinarianItemState();

}

class _VeterinarianItemState  extends State<VeterinarianItem> {

  late bool favorite;
  late DbHelper dbHelper;

  late NetworkImage image;
  final String defaultImage =
      "https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg";


  @override
  void initState() {
    favorite = false;
    dbHelper = DbHelper();
    isFavorite();
    super.initState();
  }

  Future isFavorite() async{
    await dbHelper.openDb();
    final result = await dbHelper.isFavorite(widget.veterinarianModel);
    setState(() {
      favorite = result;
    });
  }


  @override
  Widget build(BuildContext context) {

    if (widget.veterinarianModel.img != null) {
      image = NetworkImage(widget.veterinarianModel.img!);
    } else {
      image = NetworkImage(defaultImage);
    }

    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        onTap: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (_) => VeterinarianDetail(widget.veterinarianModel));
          Navigator.push(context, route);
        },
        trailing: IconButton(
          icon: Icon(Icons.favorite,
              color: favorite ? Colors.deepOrange : Colors.grey),
          onPressed: () {
            favorite?dbHelper.delete(widget.veterinarianModel): dbHelper.insert(widget.veterinarianModel);
            setState(() {
              favorite = !favorite;
            });
          },
        ),
        leading: CircleAvatar(
          backgroundImage: image,
        ),
        title: Text(widget.veterinarianModel.title!),
        subtitle: Text(
          widget.veterinarianModel.location!,
          maxLines: 2,
        ),
      ),
    );
  }

}