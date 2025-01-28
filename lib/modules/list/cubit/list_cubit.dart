import 'package:incode_test_task/data/repository/character_repository.dart';
import 'package:incode_test_task/domain/models/guesses_domain.dart';
import 'package:incode_test_task/modules/common/cubit/base_cubit.dart';
import 'package:incode_test_task/modules/home/models/guesses_ui.dart';

part 'list_state.dart';

class ListCubit extends BaseCubit<ListState> {
  ListCubit(this._characterRepository) : super(const ListState()) {
    _watchGuessesStream();
  }

  final CharacterRepository _characterRepository;

  void resetGuesses() => _resetGuesses();

  void _watchGuessesStream() {
    subscribe<GuessesDomain>(
      _characterRepository.getGuessesStream(),
      _watchGuessesStream,
      onData: (guesses) => emit(
        state.copyWith(guesses: guesses.toPresentation()),
      ),
    );
  }

  void _resetGuesses() {
    execute(
      Future.sync(_characterRepository.reset),
      retry: _resetGuesses,
    );
  }
}
