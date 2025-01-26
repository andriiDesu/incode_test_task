import 'package:flutter/foundation.dart';

@immutable
class RouteState {}

class HomeRouteState extends RouteState {}

class ListRouteState extends RouteState {}

class DetailsRouteState extends RouteState {
  DetailsRouteState(this.isGuessCorrect);

  final bool isGuessCorrect;
}
