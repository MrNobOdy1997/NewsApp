import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:new_app/model/favourites_details_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/user_details_model.dart';
class UserDatabaseHelper {
  static const _databaseName = "Newsfeed.db";
  static const _databaseVersion = 1;
  static const columnTitle = 'newsTitle';
  UserDatabaseHelper._privateConstructor();

  static final UserDatabaseHelper instance = UserDatabaseHelper._privateConstructor();
  static const userTableName = "Users";
  static const favouritesTableName = "UsersFavourite";
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $userTableName(id INTEGER PRIMARY KEY autoincrement, firstName TEXT,lastName TEXT, mailId TEXT, password TEXT, dob TEXT, gender TEXT)");
    await db.execute("CREATE TABLE $favouritesTableName(newsId INTEGER PRIMARY KEY autoincrement, newsTitle TEXT,newsDescription TEXT, newsImageUrl TEXT, newsWebUrl TEXT)");
  }
  Future<int> insert(UserData userDetails) async {
    Database? db = await instance.database;
    var res = await db!.insert(userTableName, userDetails.toMap());
    return res;
  }
  Future<List<Map<String, dynamic>>> queryFavouriteNews(RxBool loading , RxInt limit ,RxInt offSet ) async {
    log("offset $offSet");
    Database? db = await instance.database;
  //  var res = await db!.rawQuery("select * from $favouritesTableName");
  //  log("reslength ${res.length}");
    var res = await db!.rawQuery("select * from $favouritesTableName limit $limit offset $offSet");
    log("reslength ${res.length}");
    return res;
  }

  Future<List<Map<String, Object?>>> getLogin(String user, String password) async {
    Database? db = await instance.database;
    var res = await db!.rawQuery("SELECT * FROM $userTableName WHERE mailId = '$user' and password = '$password'");
    return res;
  }
  Future<int> insertToFavourite(FavouriteData favouritesDetails) async {
    Database? db = await instance.database;
    var res = await db!.insert(favouritesTableName, favouritesDetails.toMap());
    return res;
  }
  Future<int> delete(String id) async {
    Database? db = await instance.database;
    return await db!.delete(favouritesTableName, where: '$columnTitle = ?', whereArgs: [id]);
  }
}