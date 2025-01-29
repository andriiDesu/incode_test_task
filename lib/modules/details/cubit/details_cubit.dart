import 'package:incode_test_task/core/navigation/route_state.dart';
import 'package:incode_test_task/modules/common/cubit/base_cubit.dart';
import 'package:incode_test_task/modules/home/models/character_ui.dart';

part 'details_state.dart';

class DetailsCubit extends BaseCubit<DetailsState> {
  DetailsCubit(CharacterUi character) : super(DetailsState(character: character));

  void navigateBack() => addRoute(BackRouteState());
}
