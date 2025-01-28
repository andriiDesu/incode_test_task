part of 'list_cubit.dart';

class ListState extends BaseState {
  const ListState({
    this.guesses = const GuessesUi(),
  });

  final GuessesUi guesses;

  ListState copyWith({
    GuessesUi? guesses,
  }) {
    return ListState(
      guesses: guesses ?? this.guesses,
    );
  }
}
