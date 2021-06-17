// import 'dart:async';
// import 'dart:io';
// import 'package:final_test/model/posts.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
//
// class DBProvider {
//   DBProvider._();
//
//   static final DBProvider db = DBProvider._();
//   Database ?_database;
//
//
//
//
//   Future<Database?> get database async {
//
//     if (_database != null) return _database;
//     _database = await initDB();
//     return _database;
//   }
//
//   // Create the database and the Employee table
//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, 'product.db');
//
//     return await openDatabase(path, version: 1, onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//           await db.execute('CREATE TABLE Product('
//               'id INTEGER PRIMARY KEY,'
//               'icao TEXT,'
//               'name TEXT,'
//               'city TEXT,'
//               'state TEXT,'
//               'country TEXT,'
//               'elevation TEXT,'
//               'lat TEXT,'
//               'lon TEXT,'
//               'tz TEXT'
//               ')');
//         });
//   }
//
//   // Insert employee on database
//   createEmployee(PostModel newEmployee) async {
//
//     final db = await database;
//     final res = await db!.insert('Product', newEmployee.toJson());
//
//     return res;
//   }
//
//   // Delete all employees
//
//
//   Future<List<PostModel>> getAllEmployees() async {
//     final db = await database;
//     final res = await db!.rawQuery("SELECT * FROM PRODUCT");
//
//     List<PostModel> list =
//     res.isNotEmpty ? res.map((c) => PostModel.fromJson(c)).toList() : [];
//
//     return list;
//   }
// }