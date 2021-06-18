// import 'dart:async';
// import 'dart:io' as io;
// import 'package:final_test/model/posts.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
//
// class DBHelper {
//   static Database _db;
//   // Create the Table colums
//   static const String TABLE = 'airposts';
//   static const String ID = 'id';
//   static const String ICAO = 'icao';
//   static const String NAME = 'name';
//   static const String CITY = 'city';
//   static const String STATE = 'state';
//   static const String COUNTRY = 'country';
//   static const String ELEVATION = 'elevation';
//   static const String LAT = 'lat';
//   static const String LON = 'lon';
//   static const String TZ = 'tz';
//   static const String DB_NAME = 'airport.db';
//
//   // Initialize the Database
//   Future<Database> get db async {
//     if (null != _db) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }
//
//   initDb() async {
//     // Get the Device's Documents directory to store the Offline Database...
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, DB_NAME);
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return db;
//   }
//
//   _onCreate(Database db, int version) async {
//     // Create the DB Table
//     await db.execute(
//         "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $ICAO TEXT, $NAME TEXT, $CITY TEXT, $STATE TEXT,$COUNTRY TEXT,$ELEVATION TEXT,$LAT TEXT,$LON TEXT,$TZ TEXT)");
//   }
//
//
//
//   // Method to return all Albums from the DB
//   Future<PostModel> getAlbums() async {
//     var dbClient = await db;
//     // specify the column names you want in the result set
//     List<Map> maps = await dbClient.query(TABLE, columns: [ID, ICAO, NAME, CITY, STATE, COUNTRY, ELEVATION, LAT, LON, TZ ]);
//     PostModel allAlbums = PostModel();
//     List<PostModel> albums = [];
//     if (maps.length > 0) {
//       for (int i = 0; i < maps.length; i++) {
//         albums.add(PostModel.fromJson(maps[i]));
//       }
//     }
//     //
//     // allAlbums = albums;
//     return allAlbums;
//   }
//
//   // Method to Close the Database
//   Future close() async {
//     var dbClient = await db;
//     dbClient.close();
//   }
// }