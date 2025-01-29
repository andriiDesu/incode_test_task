import 'package:flutter/foundation.dart';
import 'package:incode_test_task/modules/home/models/character_ui.dart';

@immutable
class RouteState {}

class BackRouteState extends RouteState {}

class HomeRouteState extends RouteState {}

class ListRouteState extends RouteState {}

class DetailsRouteState extends RouteState {
  DetailsRouteState(this.character);

  final CharacterUi character;
}
