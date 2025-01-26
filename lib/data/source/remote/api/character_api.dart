import 'package:daily_extensions/daily_extensions.dart';
import 'package:incode_test_task/data/model/remote/character_dto.dart';
import 'package:incode_test_task/data/source/remote/api/network_service.dart';

const _charactersPath = 'api/characters';

class CharacterApi {
  CharacterApi(this._networkService);

  final NetworkService _networkService;

  Future<List<CharacterDto>> getCharacters() {
    return _networkService.request(
      _charactersPath,
      HttpMethod.get,
      onParse: (response) {
        final responseData = response.data as Map<String, dynamic>;
        return responseData.values.mapToList((character) => CharacterDto.fromJson(character));
      },
    );
  }
}