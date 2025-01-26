import 'dart:math';

import 'package:daily_extensions/daily_extensions.dart';
import 'package:incode_test_task/data/model/local/character_dbo.dart';
import 'package:incode_test_task/data/source/local/database.dart';
import 'package:incode_test_task/data/source/remote/api/character_api.dart';
import 'package:incode_test_task/domain/models/character_domain.dart';

class CharacterRepository {
  CharacterRepository(
    this._database,
    this._characterApi,
  );

  final Database _database;
  final CharacterApi _characterApi;

  Future<void> getCharactersFromApi() async {
    final charactersList = await _characterApi.getCharacters();

    final charactersDboList = charactersList.mapToList(
      (character) => character.toDbo(),
    );

    _database.saveCharacters(charactersDboList);
  }

  Future<CharacterDomain> getRandomCharacter() async {
    final random = Random();

    final characters = _database.getCharacters();

    return characters[random.nextInt(characters.length)].toDomain();
  }

  void reset() {
    _database.clear();
  }
}
