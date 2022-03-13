import 'dart:convert';
import 'package:hive/hive.dart';

part 'location_model.g.dart';

Map<String, LocationModel> locationModelFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, LocationModel>(k, LocationModel.fromJson(v)));

String locationModelToJson(Map<String, LocationModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class LocationModel {
  LocationModel({
    this.icao,
    this.iata,
    this.name,
    this.city,
    this.state,
    this.country,
    this.elevation,
    this.lat,
    this.lon,
    this.tz,
  });

  String? icao;
  String? iata;
  String? name;
  String? city;
  String? state;
  String? country;
  int? elevation;
  double? lat;
  double? lon;
  String? tz;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        icao: json["icao"],
        iata: json["iata"],
        name: json["name"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        elevation: json["elevation"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        tz: json["tz"],
      );

  Map<String, dynamic> toJson() => {
        "icao": icao,
        "iata": iata,
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

// Hive database items
@HiveType(typeId: 1)
class LocationHiveModel extends HiveObject {
  @HiveField(0)
  String? icao;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? city;

  @HiveField(3)
  String? state;

  @HiveField(4)
  String? country;

  @HiveField(5)
  double? lat;

  @HiveField(6)
  double? lon;
}
