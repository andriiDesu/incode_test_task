// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guesses_dbo.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class GuessesDbo extends $GuessesDbo
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  GuessesDbo(
    int id, {
    int successCount = 0,
    int failureCount = 0,
    Iterable<CharacterDbo> guesses = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<GuessesDbo>({
        'id': 0,
        'successCount': 0,
        'failureCount': 0,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'successCount', successCount);
    RealmObjectBase.set(this, 'failureCount', failureCount);
    RealmObjectBase.set<RealmList<CharacterDbo>>(
        this, 'guesses', RealmList<CharacterDbo>(guesses));
  }

  GuessesDbo._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get successCount => RealmObjectBase.get<int>(this, 'successCount') as int;
  @override
  set successCount(int value) =>
      RealmObjectBase.set(this, 'successCount', value);

  @override
  int get failureCount => RealmObjectBase.get<int>(this, 'failureCount') as int;
  @override
  set failureCount(int value) =>
      RealmObjectBase.set(this, 'failureCount', value);

  @override
  RealmList<CharacterDbo> get guesses =>
      RealmObjectBase.get<CharacterDbo>(this, 'guesses')
          as RealmList<CharacterDbo>;
  @override
  set guesses(covariant RealmList<CharacterDbo> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<GuessesDbo>> get changes =>
      RealmObjectBase.getChanges<GuessesDbo>(this);

  @override
  Stream<RealmObjectChanges<GuessesDbo>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<GuessesDbo>(this, keyPaths);

  @override
  GuessesDbo freeze() => RealmObjectBase.freezeObject<GuessesDbo>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'successCount': successCount.toEJson(),
      'failureCount': failureCount.toEJson(),
      'guesses': guesses.toEJson(),
    };
  }

  static EJsonValue _toEJson(GuessesDbo value) => value.toEJson();
  static GuessesDbo _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
      } =>
        GuessesDbo(
          fromEJson(ejson['id'], defaultValue: 0),
          successCount: fromEJson(ejson['successCount'], defaultValue: 0),
          failureCount: fromEJson(ejson['failureCount'], defaultValue: 0),
          guesses: fromEJson(ejson['guesses'], defaultValue: const []),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(GuessesDbo._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, GuessesDbo, 'GuessesDbo', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('successCount', RealmPropertyType.int),
      SchemaProperty('failureCount', RealmPropertyType.int),
      SchemaProperty('guesses', RealmPropertyType.object,
          linkTarget: 'CharacterDbo', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
