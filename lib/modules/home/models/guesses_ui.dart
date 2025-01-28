import 'package:daily_extensions/daily_extensions.dart';
import 'package:incode_test_task/domain/models/guesses_domain.dart';
import 'package:incode_test_task/modules/home/models/character_ui.dart';

class GuessesUi {
  const GuessesUi({
    this.successCount = 0,
    this.failureCount = 0,
    this.guesses = const [],
  });

  final int successCount;
  final int failureCount;
  final List<CharacterUi> guesses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuessesUi &&
          runtimeType == other.runtimeType &&
          successCount == other.successCount &&
          failureCount == other.failureCount &&
          guesses == other.guesses;

  @override
  int get hashCode => successCount.hashCode ^ failureCount.hashCode ^ guesses.hashCode;

  GuessesUi copyWith({
    int? successCount,
    int? failureCount,
    List<CharacterUi>? guesses,
  }) {
    return GuessesUi(
      successCount: successCount ?? this.successCount,
      failureCount: failureCount ?? this.failureCount,
      guesses: guesses ?? this.guesses,
    );
  }
}

extension GuessesUiMapper on GuessesDomain {
  GuessesUi toPresentation() {
    return GuessesUi(
      successCount: successCount,
      failureCount: failureCount,
      guesses: guesses.isNotEmpty ? guesses.mapToList((e) => e.toPresentation()) : [],
    );
  }
}
