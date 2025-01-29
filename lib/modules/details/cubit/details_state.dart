part of 'details_cubit.dart';

class DetailsState extends BaseState {
  const DetailsState({
    required this.character,
  });

  final CharacterUi? character;

  DetailsState copyWith({
    CharacterUi? character,
  }) {
    return DetailsState(
      character: character ?? this.character,
    );
  }
}
