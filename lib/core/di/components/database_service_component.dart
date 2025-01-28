import 'package:incode_test_task/data/model/local/character_dbo.dart';
import 'package:incode_test_task/data/model/local/guesses_dbo.dart';
import 'package:incode_test_task/data/source/local/database.dart';
import 'package:realm/realm.dart';

Database createDatabaseComponent() {
  final realm = Realm(
    Configuration.local(
      [
        CharacterDbo.schema,
        GuessesDbo.schema,
      ],
      schemaVersion: 0,
    ),
  );

  final instance = Database(realm);

  return instance;
}
