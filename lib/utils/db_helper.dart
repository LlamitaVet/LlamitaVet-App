import 'package:llamita_vet/models/veterinarian_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final int version = 1;
  final String databaseName = 'vertinarians.db';
  final String tableName = "veterinarias";

  Database? db;

  Future<Database> openDb() async {
    db ??= await openDatabase(join(await getDatabasesPath(), databaseName),
        onCreate: (database, version){
      database.execute(
        'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT, poster TEXT)'
      );
        }, version: version);
    return db as Database;
  }

  insert(VeterinarianModel veterinarian) async {
    await db?.insert(tableName, veterinarian.toMap());
  }

  delete(VeterinarianModel veterinarian) async{
    await db?.delete(tableName, where: 'id=?', whereArgs: [veterinarian.id!]);
  }

  Future<bool> isFavorite(VeterinarianModel veterinarian) async{
    final maps = await db?.query(tableName, where: 'id=?', whereArgs: [veterinarian.id!]);
    return maps!.isNotEmpty;
  }


}