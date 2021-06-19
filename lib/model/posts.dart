class PostModel {

  static List<PostModel> items;
  final String icao;
  final String name;
  final String city;
  final String state;
  final String country;
  final String elevation;
  final String lat;
  final String lon;
  final String tz;

  PostModel({  this.icao,  this.name,  this.city,  this.state,  this.country,  this.elevation,  this.lat,  this.lon,  this.tz});

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      icao: map["icao"].toString(),
      name: map["name"].toString(),
      city: map["city"].toString(),
      state: map["state"].toString(),
      country: map["country"].toString(),
      elevation: map["elevation"].toString(),
      lat: map["lat"].toString(),
      lon: map["lon"].toString(),
      tz: map["tz"].toString(),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "icao": icao,
        "name": name,
        "city": city,
        "state": state,
        "country": country,
        "elevation": elevation,
        "lat": lat,
        "lon": lon,
        "tz": tz,
      };

}

