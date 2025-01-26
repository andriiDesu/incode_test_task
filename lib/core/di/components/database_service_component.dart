import 'package:incode_test_task/data/source/local/database.dart';
import 'package:realm/realm.dart';

Database createDatabaseComponent() {
  final realm = Realm(
    Configuration.local(
      [],
      schemaVersion: 1,
    ),
  );

  final instance = Database(realm);

  return instance;
}
