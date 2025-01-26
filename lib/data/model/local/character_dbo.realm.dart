// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dbo.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CharacterDbo extends $CharacterDbo
    with RealmEntity, RealmObjectBase, RealmObject {
  CharacterDbo(
    String id,
    String name,
    String house,
    String species,
    String actor,
    String dateOfBirth,
    String image,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'house', house);
    RealmObjectBase.set(this, 'species', species);
    RealmObjectBase.set(this, 'actor', actor);
    RealmObjectBase.set(this, 'dateOfBirth', dateOfBirth);
    RealmObjectBase.set(this, 'image', image);
  }

  CharacterDbo._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => throw RealmUnsupportedSetError();

  @override
  String get house => RealmObjectBase.get<String>(this, 'house') as String;
  @override
  set house(String value) => throw RealmUnsupportedSetError();

  @override
  String get species => RealmObjectBase.get<String>(this, 'species') as String;
  @override
  set species(String value) => throw RealmUnsupportedSetError();

  @override
  String get actor => RealmObjectBase.get<String>(this, 'actor') as String;
  @override
  set actor(String value) => throw RealmUnsupportedSetError();

  @override
  String get dateOfBirth =>
      RealmObjectBase.get<String>(this, 'dateOfBirth') as String;
  @override
  set dateOfBirth(String value) => throw RealmUnsupportedSetError();

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<CharacterDbo>> get changes =>
      RealmObjectBase.getChanges<CharacterDbo>(this);

  @override
  Stream<RealmObjectChanges<CharacterDbo>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CharacterDbo>(this, keyPaths);

  @override
  CharacterDbo freeze() => RealmObjectBase.freezeObject<CharacterDbo>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'house': house.toEJson(),
      'species': species.toEJson(),
      'actor': actor.toEJson(),
      'dateOfBirth': dateOfBirth.toEJson(),
      'image': image.toEJson(),
    };
  }

  static EJsonValue _toEJson(CharacterDbo value) => value.toEJson();
  static CharacterDbo _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'house': EJsonValue house,
        'species': EJsonValue species,
        'actor': EJsonValue actor,
        'dateOfBirth': EJsonValue dateOfBirth,
        'image': EJsonValue image,
      } =>
        CharacterDbo(
          fromEJson(id),
          fromEJson(name),
          fromEJson(house),
          fromEJson(species),
          fromEJson(actor),
          fromEJson(dateOfBirth),
          fromEJson(image),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CharacterDbo._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, CharacterDbo, 'CharacterDbo', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.fullText),
      SchemaProperty('house', RealmPropertyType.string,
          indexType: RealmIndexType.fullText),
      SchemaProperty('species', RealmPropertyType.string,
          indexType: RealmIndexType.fullText),
      SchemaProperty('actor', RealmPropertyType.string,
          indexType: RealmIndexType.fullText),
      SchemaProperty('dateOfBirth', RealmPropertyType.string),
      SchemaProperty('image', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
