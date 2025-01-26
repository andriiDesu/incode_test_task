import 'package:incode_test_task/data/model/remote/character_dto.dart';
import 'package:incode_test_task/domain/models/character_domain.dart';
import 'package:realm/realm.dart';

part 'character_dbo.realm.dart';

@RealmModel()
class $CharacterDbo {
  @PrimaryKey()
  late String id;
  @Indexed(RealmIndexType.fullText)
  late final String name;
  @Indexed(RealmIndexType.fullText)
  late final String house;
  @Indexed(RealmIndexType.fullText)
  late final String species;
  @Indexed(RealmIndexType.fullText)
  late final String actor;
  late final String dateOfBirth;
  late final String image;
}

extension CharacterDtoMapper on CharacterDto {
  CharacterDbo toDbo() {
    return CharacterDbo(
      id,
      name,
      house,
      species,
      actor,
      dateOfBirth,
      image,
    );
  }
}

extension CharacterDomainMapper on CharacterDomain {
  CharacterDbo toDbo() {
    return CharacterDbo(
      id,
      name,
      house,
      species,
      actor,
      dateOfBirth,
      image,
    );
  }
}
