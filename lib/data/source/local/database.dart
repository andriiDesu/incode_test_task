import 'package:incode_test_task/data/model/local/character_dbo.dart';
import 'package:realm/realm.dart';

class Database {
  const Database(this._realm);

  final Realm _realm;

  void saveCharacters(List<CharacterDbo> characters) => _realm.write(
        () => _realm.addAll<CharacterDbo>(characters, update: true),
      );

  List<CharacterDbo> getCharacters() => _realm.all<CharacterDbo>().toList();

  void clear() => _realm.write(
        () => _realm.deleteAll(),//TODO: Add guess model type
      );
}
