import 'dart:math';

import 'package:daily_extensions/daily_extensions.dart';
import 'package:incode_test_task/data/model/local/character_dbo.dart';
import 'package:incode_test_task/data/model/local/guesses_dbo.dart';
import 'package:incode_test_task/data/source/local/database.dart';
import 'package:incode_test_task/data/source/remote/api/character_api.dart';
import 'package:incode_test_task/domain/models/character_domain.dart';
import 'package:incode_test_task/domain/models/guesses_domain.dart';

class CharacterRepository {
  CharacterRepository(
    this._database,
    this._characterApi,
  );

  final Database _database;
  final CharacterApi _characterApi;

  Future<CharacterDomain> getCharactersFromApi() async {
    final charactersList = await _characterApi.getCharacters();

    final charactersDboList = charactersList.mapToList(
      (character) => character.toDbo(),
    );

    _database.saveCharacters(charactersDboList);

    return getRandomCharacter(charactersDboList);
  }

  Future<CharacterDomain> getRandomCharacter([List<CharacterDbo>? charactersList]) async {
    final random = Random();

    final characters = charactersList ?? _database.getCharacters();

    return characters[random.nextInt(characters.length)].toDomain();
  }

  Stream<GuessesDomain> getGuessesStream() => _database.getGuessesStream().map(
        (guesses) => guesses.toDomain(),
      );

  void reset() {
    _database.clear();
  }

  void updateGuess(GuessesDomain guess) => _database.updateGuess(
        guess.toDbo(),
      );
}
