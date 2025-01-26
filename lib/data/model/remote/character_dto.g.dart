// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) => CharacterDto(
      id: json['id'] as String,
      name: json['name'] as String,
      species: json['species'] as String,
      house: json['house'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      actor: json['actor'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CharacterDtoToJson(CharacterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.species,
      'house': instance.house,
      'dateOfBirth': instance.dateOfBirth,
      'actor': instance.actor,
      'image': instance.image,
    };
