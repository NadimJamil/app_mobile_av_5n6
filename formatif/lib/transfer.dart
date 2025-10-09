import 'package:json_annotation/json_annotation.dart';

part 'transfer.g.dart';

@JsonSerializable()
class Animal{
  Animal(this.nom, this.espece, this.famille, this.continent);

  String nom;
  String espece;
  String famille;
  String continent;

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalToJson(this);
}