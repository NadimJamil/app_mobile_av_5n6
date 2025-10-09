// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) => Animal(
  json['nom'] as String,
  json['espece'] as String,
  json['famille'] as String,
  json['continent'] as String,
);

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
  'nom': instance.nom,
  'espece': instance.espece,
  'famille': instance.famille,
  'continent': instance.continent,
};
