// import 'package:final_test/provider/db_provider.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// import '../model/posts.dart';
// import 'db_provider.dart';
//
// var url = Uri.parse('https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');
//
//
// class EmployeeApiProvider {
//
//   Future<List<PostModel>> getAllEmployees() async {
//     // var url = Uri.parse(
//     //     'https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');
//
//     Response response = await http.get(url);
//     Map<String, dynamic> decoded = jsonDecode(response.body).toList();
//     //debugPrint(response);
//     return  DBProvider.db.createEmployee(PostModel.fromJson(decoded));
//     // return employeeFromJson(response.data).map((employee) {
//     //   print('Inserting $employee');
//     //   DBProvider.db.createEmployee(employee);
//     // }).toList();
//   }
//
//
//
//   // Future<List<PostModel>> getAllEmployees() async {
//   // //  Response response = await Dio().get(url);
//   //   var response = await http.get(url);
//   //   Map<String, dynamic> decoded = jsonDecode(response.body).toList();
//   //
//   // return  DBProvider.db.createEmployee(PostModel.fromJson(decoded));
//   //   // return (decoded.data as List).map((employee) {
//   //   //
//   //   //   DBProvider.db.createEmployee(PostModel.fromJson(employee));
//   //   // }).toList();
//   // }
// }