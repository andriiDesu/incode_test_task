import 'package:incode_test_task/domain/models/character_domain.dart';

class CharacterUi {
  CharacterUi({
    required this.id,
    required this.name,
    required this.house,
    required this.species,
    required this.actor,
    required this.image,
    required this.isSuccess,
    this.dateOfBirth,
  });

  final String id;
  final String name;
  final String house;
  final String species;
  final String actor;
  final String? dateOfBirth;
  final String image;
  final bool isSuccess;
}

extension CharacterUiMapper on CharacterDomain {
  CharacterUi toPresentation() {
    return CharacterUi(
      id: id,
      name: name,
      house: house,
      species: species,
      actor: actor,
      dateOfBirth: dateOfBirth,
      image: image,
      isSuccess: isSuccess,
    );
  }
}