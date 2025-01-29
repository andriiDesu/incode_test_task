import 'dart:async';

import 'package:incode_test_task/data/repository/character_repository.dart';
import 'package:incode_test_task/domain/enums/house_enum.dart';
import 'package:incode_test_task/domain/models/character_domain.dart';
import 'package:incode_test_task/domain/models/guesses_domain.dart';
import 'package:incode_test_task/modules/common/cubit/base_cubit.dart';
import 'package:incode_test_task/modules/home/models/character_ui.dart';
import 'package:incode_test_task/modules/home/models/guesses_ui.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(this._characterRepository) : super(const HomeState()) {
    _watchGuessesStream();
    _getCharacter();
  }

  final CharacterRepository _characterRepository;

  void resetGuesses() => _resetGuesses();

  void guessAffiliation(HouseEnum house) => _guessAffiliation(house);

  Future<void> getCharacter() => _getCharacter();

  void _watchGuessesStream() {
    subscribe<GuessesDomain>(
      _characterRepository.getGuessesStream(),
      _watchGuessesStream,
      onData: (guesses) => emit(
        state.copyWith(guesses: guesses.toPresentation()),
      ),
    );
  }

  Future<void> _getCharacter() {
    var completer = Completer();

    execute<CharacterDomain>(
      _characterRepository.getCharactersFromApi(),
      retry: _getCharacter,
      onSuccess: (character) {
        emit(
          state.copyWith(character: character.toPresentation()),
        );
        completer.complete();
      },
    );

    return completer.future;
  }

  void _guessAffiliation(HouseEnum house) {
    if (state.character == null) return;

    var guesses = state.guesses;
    var character = state.character!;

    if (house.name == character.house || (house.index == 4 && character.house == '')) {
      guesses = guesses.copyWith(successCount: guesses.successCount + 1);
      character = character.copyWith(isSuccess: true);
    } else {
      guesses = guesses.copyWith(failureCount: guesses.failureCount + 1);
    }

    guesses = guesses.copyWith(
      guesses: [character, ...guesses.guesses],
    );

    _updateGuesses(guesses);
  }

  void _updateGuesses(GuessesUi guesses) {
    execute(
      Future.sync(
        () => _characterRepository.updateGuess(guesses.toDomain()),
      ),
      retry: () => _updateGuesses(guesses),
      onSuccess: (_) {
        emit(state.copyWithNull());
        _getCharacter();
      },
    );
  }

  void _resetGuesses() {
    execute(
      Future.sync(_characterRepository.reset),
      retry: _resetGuesses,
    );
  }
}
