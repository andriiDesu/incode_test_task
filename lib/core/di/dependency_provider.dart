import 'package:get_it/get_it.dart';
import 'package:incode_test_task/core/di/components/database_service_component.dart';
import 'package:incode_test_task/core/di/components/network_service_component.dart';

T get<T extends Object>() => GetIt.I<T>();

Future<void> setupDI() async {
  GetIt.I
    ..registerSingleton( createDatabaseComponent())
    ..registerSingleton(createNetworkService());
}