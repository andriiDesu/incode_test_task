import 'package:daily_extensions/daily_extensions.dart';
import 'package:incode_test_task/data/model/local/guesses_dbo.dart';
import 'package:incode_test_task/domain/models/character_domain.dart';
import 'package:incode_test_task/modules/home/models/guesses_ui.dart';

class GuessesDomain {
  GuessesDomain({
    required this.successCount,
    required this.failureCount,
    required this.guesses,
  });


  final int successCount;
  final int failureCount;
  final List<CharacterDomain> guesses;
}

extension GuessesDomainMapper on GuessesDbo {
  GuessesDomain toDomain() {
    return GuessesDomain(
      successCount: successCount,
      failureCount: failureCount,
      guesses: guesses.mapToList((e) => e.toDomain()),
    );
  }
}

extension GuessesUiMapper on GuessesUi {
  GuessesDomain toDomain() {
    return GuessesDomain(
      successCount: successCount,
      failureCount: failureCount,
      guesses: guesses.mapToList((e) => e.toDomain()),
    );
  }
}
