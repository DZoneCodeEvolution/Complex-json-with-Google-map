import 'dart:convert';
import 'package:final_test/model/posts.dart';
import 'package:final_test/pages/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var url = Uri.parse('https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');

  List _dates = [];
  final List<PostModel> items = [];
  var isLoading = false;

  // DBHelper dbHelper;

  @override
  void initState() {
    super.initState();
      fetchUsers();
    // _loadFromApi();
  }

  // _loadFromApi() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //var apiProvider = Services();
  //  await Services.getData();

  // wait for 2 seconds to simulate loading of data
  // await Future.delayed(const Duration(seconds: 2));

  // setState(() {
  //   isLoading = false;
  // });
  //}

  fetchUsers() async {
    var result = await http.get(url);
    Map<String, dynamic> decodedDoughnut = jsonDecode(result.body);

    // print(jsonDecode(decodedDoughnut.toString()));

    decodedDoughnut.keys.forEach((String key) {
      _dates.add(key);
    });
    for (int i = 0; i < _dates.length; i++) {
      PostModel event = PostModel(
        icao: decodedDoughnut[_dates[i]]["icao"].toString(),
        name: decodedDoughnut[_dates[i]]["name"].toString(),
        city: decodedDoughnut[_dates[i]]["city"].toString(),
        state: decodedDoughnut[_dates[i]]["state"].toString(),
        country: decodedDoughnut[_dates[i]]["country"].toString(),
        elevation: decodedDoughnut[_dates[i]]["elevation"].toString(),
        lat: decodedDoughnut[_dates[i]]["lat"].toString(),
        lon: decodedDoughnut[_dates[i]]["lon"].toString(),
        tz: decodedDoughnut[_dates[i]]["tz"].toString(),
      );

      items.add(event);

      //  print(jsonDecode(decodedDoughnut[_dates[i]]).toString());
      //  PostModel.items = List.from(event).map<PostModel>((item) => PostModel.fromMap(item)).toList();

    }
    print(items.length);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(" Airports "),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(catelog: items[index])),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      items[index].name,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      items[index].city,
                    ),
                    trailing: Text(items[index].icao),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

// FutureBuilder(
// future: DBProvider.db.getAllEmployees(),
// builder: (BuildContext context, AsyncSnapshot snapshot) {
// if (!snapshot.hasData) {
// return Center(
// child: CircularProgressIndicator(),
// );
// } else {
// return ListView.separated(
// separatorBuilder: (context, index) => Divider(
// color: Colors.black12,
// ),
// itemCount: snapshot.data.length,
// itemBuilder: (BuildContext context, int index) {
// return ListTile(
// leading: Text(
// "${index + 1}",
// style: TextStyle(fontSize: 20.0),
// ),
// title: Text(
// "Name: ${snapshot.data[index].firstName} ${snapshot.data[index].lastName} "),
// subtitle: Text('EMAIL: ${snapshot.data[index].email}'),
// );
// },
// );
// }
// },
// );
//
//
//

// ListView.builder(
// padding: const EdgeInsets.all(8),
// itemCount: items.length,
// itemBuilder: (BuildContext context, int index) {
// return InkWell(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => DetailScreen( catelog : items[index])),
// );
// },
// child: Card(
// child: ListTile(
// title: Text(
// items[index].name,
// style: TextStyle(color: Colors.black),
// ),
// subtitle: Text(items[index].city,),
// trailing: Text(items[index].icao),
//
// ),
// ),
// );
// }),
// ),
// );
