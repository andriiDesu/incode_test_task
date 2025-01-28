import 'package:get_it/get_it.dart';
import 'package:incode_test_task/core/di/components/database_service_component.dart';
import 'package:incode_test_task/core/di/components/network_service_component.dart';
import 'package:incode_test_task/data/repository/character_repository.dart';
import 'package:incode_test_task/data/source/remote/api/character_api.dart';

T get<T extends Object>() => GetIt.I<T>();

Future<void> setupDI() async {
  GetIt.I
    ..registerSingleton(createDatabaseComponent())
    ..registerSingleton(createNetworkService())
    ..registerFactory(() => CharacterApi(get()))
    ..registerFactory(() => CharacterRepository(get(), get()));
}
