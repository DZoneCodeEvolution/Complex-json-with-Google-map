// import 'package:final_test/model/posts.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// import 'db_provider.dart';

// class AirportApiProvider {
//   Future<List<PostModel>> getAllEmployees() async {
//     var url = Uri.parse(
//         'https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');
//
//     Response response = await http.get(url);
//     //debugPrint(response);
//
//     return employeeFromJson(response.data).map((employee) {
//       print('Inserting $employee');
//       DBProvider.db.createEmployee(employee);
//     }).toList();
//   }
// }