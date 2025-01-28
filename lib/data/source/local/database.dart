import 'package:incode_test_task/data/model/local/character_dbo.dart';
import 'package:incode_test_task/data/model/local/guesses_dbo.dart';
import 'package:realm/realm.dart';

class Database {
  const Database(this._realm);

  final Realm _realm;

  void saveCharacters(List<CharacterDbo> characters) => _realm.write(
        () => _realm.addAll<CharacterDbo>(characters, update: true),
      );

  List<CharacterDbo> getCharacters() => _realm.all<CharacterDbo>().toList();

  Stream<GuessesDbo> getGuessesStream() =>
      _realm.find<GuessesDbo>(0)?.changes.map(
            (guesses) => guesses.object,
          ) ??
      Stream.value(GuessesDbo(0));

  void updateGuess(GuessesDbo guess) => _realm.write(
        () => _realm.add<GuessesDbo>(guess, update: true),
      );

  void clear() => _realm.write(
        () => _realm.add<GuessesDbo>(
          GuessesDbo(0),
          update: true,
        ),
      );
}
