import 'package:json_annotation/json_annotation.dart';

part 'character_dto.g.dart';

@JsonSerializable()
class CharacterDto {
  CharacterDto({
    required this.id,
    required this.name,
    required this.species,
    required this.house,
    required this.actor,
    required this.image,
    this.dateOfBirth,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) => _$CharacterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDtoToJson(this);
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "species")
  String species;
  @JsonKey(name: "house")
  String house;
  @JsonKey(name: "dateOfBirth")
  String? dateOfBirth;
  @JsonKey(name: "actor")
  String actor;
  @JsonKey(name: "image")
  String image;
}
