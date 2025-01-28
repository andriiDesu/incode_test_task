import 'package:daily_extensions/daily_extensions.dart';
import 'package:incode_test_task/data/model/local/character_dbo.dart';
import 'package:incode_test_task/domain/models/guesses_domain.dart';
import 'package:realm/realm.dart';

part 'guesses_dbo.realm.dart';

@RealmModel()
class $GuessesDbo {
  @PrimaryKey()
  int id = 0;
  int successCount = 0;
  int failureCount = 0;
  List<$CharacterDbo> guesses = [];
}

extension GuessesDomainMapper on GuessesDomain {
  GuessesDbo toDbo() {
    return GuessesDbo(
      0,
      successCount: successCount,
      failureCount: failureCount,
      guesses: guesses.mapToList(
        (e) => e.toDbo(),
      ),
    );
  }
}
