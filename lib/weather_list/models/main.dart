import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main extends Equatable {
  final double temp;

  const Main({required this.temp});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  List<Object> get props => [temp];

  @override
  bool get stringify => true;
}
