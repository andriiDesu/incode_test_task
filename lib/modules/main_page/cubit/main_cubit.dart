import 'package:incode_test_task/core/navigation/route_state.dart';
import 'package:incode_test_task/modules/common/cubit/base_cubit.dart';

part 'main_state.dart';

const _homePageIndex = 0;
const _listPageIndex = 1;

class MainCubit extends BaseCubit<MainState> {
  MainCubit() : super(const MainState());

  void onPageChanged(int index) {
    emit(MainState(currentIndex: index));

    if (state.currentIndex != index) {
      switch (index) {
        case _homePageIndex:
          addRoute(HomeRouteState());
          break;
        case _listPageIndex:
          addRoute(ListRouteState());
          break;
      }
    }
  }
}
