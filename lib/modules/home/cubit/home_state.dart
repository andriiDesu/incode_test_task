part of 'home_cubit.dart';

class HomeState extends BaseState {
  const HomeState({
    this.character,
    this.guesses = const GuessesUi(),
  });

  final CharacterUi? character;
  final GuessesUi guesses;

  HomeState copyWith({
    CharacterUi? character,
    GuessesUi? guesses,
  }) {
    return HomeState(
      character: character ?? this.character,
      guesses: guesses ?? this.guesses,
    );
  }

  HomeState copyWithNull({
    CharacterUi? character,
    GuessesUi? guesses,
  }) {
    return HomeState(
      character: character,
      guesses: guesses ?? this.guesses,
    );
  }
}
