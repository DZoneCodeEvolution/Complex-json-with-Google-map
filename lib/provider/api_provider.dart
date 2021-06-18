// import 'dart:convert';
// import 'package:final_test/model/posts.dart';
// import 'package:http/http.dart' as http;
//
//
// class Services {
//   //
//   static List<PostModel> albums;
//   var url = Uri.parse('https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');
//
//   static Future<PostModel> getData() async {
//     var url = Uri.parse('https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');
//     List _dates = [];
//  //   final List<PostModel> items = [];
//
//       final response =  await http.get(url);
//       Map<String, dynamic> decodedDoughnut = jsonDecode(response.body);
//       if (200 == response.statusCode) {
//
//
//         // print(jsonDecode(decodedDoughnut.toString()));
//
//         decodedDoughnut.keys.forEach((String key) {
//           _dates.add(key);
//         });
//         for (int i = 0; i < _dates.length; i++) {
//           PostModel event = PostModel(
//
//             icao: decodedDoughnut[_dates[i]]["icao"].toString(),
//
//             name: decodedDoughnut[_dates[i]]["name"].toString(),
//
//             city: decodedDoughnut[_dates[i]]["city"].toString(),
//
//             state: decodedDoughnut[_dates[i]]["state"].toString(),
//
//             country: decodedDoughnut[_dates[i]]["country"].toString(),
//
//             elevation: decodedDoughnut[_dates[i]]["elevation"].toString(),
//
//             lat: decodedDoughnut[_dates[i]]["lat"].toString(),
//
//             lon: decodedDoughnut[_dates[i]]["lon"].toString(),
//
//             tz: decodedDoughnut[_dates[i]]["tz"].toString(),
//
//           );
//
//           PostModel.items.add(event);
//
//         }
//         print(PostModel.items.length);
//
//         } else {
//         PostModel albums = new PostModel();
//          //= [];
//         return albums; // we are returning empty album list
//         // Handle these as you want...
//       }
//
//   }
//
//
// }
