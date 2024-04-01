import 'package:json_annotation/json_annotation.dart';

import 'coord.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  int? id;
  String? name;
  Coord? coord;

  City({this.id, this.name, this.coord});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
