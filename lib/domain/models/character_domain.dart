import 'package:incode_test_task/data/model/local/character_dbo.dart';

class CharacterDomain {
  CharacterDomain({
    required this.id,
    required this.name,
    required this.house,
    required this.species,
    required this.actor,
    required this.dateOfBirth,
    required this.image,
  });

  final String id;
  final String name;
  final String house;
  final String species;
  final String actor;
  final String dateOfBirth;
  final String image;
}

extension CharacterDomainMapper on CharacterDbo {
  CharacterDomain toDomain() {
    return CharacterDomain(
      id: id,
      name: name,
      house: house,
      species: species,
      actor: actor,
      dateOfBirth: dateOfBirth,
      image: image,
    );
  }
}
