// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_cards.dart';

// ignore_for_file: type=lint
class $DatabaseCardsTable extends DatabaseCards
    with TableInfo<$DatabaseCardsTable, DatabaseCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DatabaseCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 15),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _meaningMeta =
      const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
      'meaning', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pronunciationMeta =
      const VerificationMeta('pronunciation');
  @override
  late final GeneratedColumn<String> pronunciation = GeneratedColumn<String>(
      'pronunciation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _collocationMeta =
      const VerificationMeta('collocation');
  @override
  late final GeneratedColumn<String> collocation = GeneratedColumn<String>(
      'collocation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exampleMeta =
      const VerificationMeta('example');
  @override
  late final GeneratedColumn<String> example = GeneratedColumn<String>(
      'example', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
      'origin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memorizedTypeMeta =
      const VerificationMeta('memorizedType');
  @override
  late final GeneratedColumn<int> memorizedType = GeneratedColumn<int>(
      'memorized_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        word,
        meaning,
        pronunciation,
        level,
        collocation,
        example,
        origin,
        memorizedType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'database_cards';
  @override
  VerificationContext validateIntegrity(Insertable<DatabaseCard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('pronunciation')) {
      context.handle(
          _pronunciationMeta,
          pronunciation.isAcceptableOrUnknown(
              data['pronunciation']!, _pronunciationMeta));
    } else if (isInserting) {
      context.missing(_pronunciationMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('collocation')) {
      context.handle(
          _collocationMeta,
          collocation.isAcceptableOrUnknown(
              data['collocation']!, _collocationMeta));
    } else if (isInserting) {
      context.missing(_collocationMeta);
    }
    if (data.containsKey('example')) {
      context.handle(_exampleMeta,
          example.isAcceptableOrUnknown(data['example']!, _exampleMeta));
    } else if (isInserting) {
      context.missing(_exampleMeta);
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    } else if (isInserting) {
      context.missing(_originMeta);
    }
    if (data.containsKey('memorized_type')) {
      context.handle(
          _memorizedTypeMeta,
          memorizedType.isAcceptableOrUnknown(
              data['memorized_type']!, _memorizedTypeMeta));
    } else if (isInserting) {
      context.missing(_memorizedTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DatabaseCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DatabaseCard(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      meaning: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning'])!,
      pronunciation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pronunciation'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      collocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collocation'])!,
      example: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}example'])!,
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin'])!,
      memorizedType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}memorized_type'])!,
    );
  }

  @override
  $DatabaseCardsTable createAlias(String alias) {
    return $DatabaseCardsTable(attachedDatabase, alias);
  }
}

class DatabaseCard extends DataClass implements Insertable<DatabaseCard> {
  final int id;
  final String word;
  final String meaning;
  final String pronunciation;
  final String level;
  final String collocation;
  final String example;
  final String origin;
  final int memorizedType;
  const DatabaseCard(
      {required this.id,
      required this.word,
      required this.meaning,
      required this.pronunciation,
      required this.level,
      required this.collocation,
      required this.example,
      required this.origin,
      required this.memorizedType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['meaning'] = Variable<String>(meaning);
    map['pronunciation'] = Variable<String>(pronunciation);
    map['level'] = Variable<String>(level);
    map['collocation'] = Variable<String>(collocation);
    map['example'] = Variable<String>(example);
    map['origin'] = Variable<String>(origin);
    map['memorized_type'] = Variable<int>(memorizedType);
    return map;
  }

  DatabaseCardsCompanion toCompanion(bool nullToAbsent) {
    return DatabaseCardsCompanion(
      id: Value(id),
      word: Value(word),
      meaning: Value(meaning),
      pronunciation: Value(pronunciation),
      level: Value(level),
      collocation: Value(collocation),
      example: Value(example),
      origin: Value(origin),
      memorizedType: Value(memorizedType),
    );
  }

  factory DatabaseCard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DatabaseCard(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      meaning: serializer.fromJson<String>(json['meaning']),
      pronunciation: serializer.fromJson<String>(json['pronunciation']),
      level: serializer.fromJson<String>(json['level']),
      collocation: serializer.fromJson<String>(json['collocation']),
      example: serializer.fromJson<String>(json['example']),
      origin: serializer.fromJson<String>(json['origin']),
      memorizedType: serializer.fromJson<int>(json['memorizedType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'meaning': serializer.toJson<String>(meaning),
      'pronunciation': serializer.toJson<String>(pronunciation),
      'level': serializer.toJson<String>(level),
      'collocation': serializer.toJson<String>(collocation),
      'example': serializer.toJson<String>(example),
      'origin': serializer.toJson<String>(origin),
      'memorizedType': serializer.toJson<int>(memorizedType),
    };
  }

  DatabaseCard copyWith(
          {int? id,
          String? word,
          String? meaning,
          String? pronunciation,
          String? level,
          String? collocation,
          String? example,
          String? origin,
          int? memorizedType}) =>
      DatabaseCard(
        id: id ?? this.id,
        word: word ?? this.word,
        meaning: meaning ?? this.meaning,
        pronunciation: pronunciation ?? this.pronunciation,
        level: level ?? this.level,
        collocation: collocation ?? this.collocation,
        example: example ?? this.example,
        origin: origin ?? this.origin,
        memorizedType: memorizedType ?? this.memorizedType,
      );
  @override
  String toString() {
    return (StringBuffer('DatabaseCard(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('meaning: $meaning, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('level: $level, ')
          ..write('collocation: $collocation, ')
          ..write('example: $example, ')
          ..write('origin: $origin, ')
          ..write('memorizedType: $memorizedType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, meaning, pronunciation, level,
      collocation, example, origin, memorizedType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DatabaseCard &&
          other.id == this.id &&
          other.word == this.word &&
          other.meaning == this.meaning &&
          other.pronunciation == this.pronunciation &&
          other.level == this.level &&
          other.collocation == this.collocation &&
          other.example == this.example &&
          other.origin == this.origin &&
          other.memorizedType == this.memorizedType);
}

class DatabaseCardsCompanion extends UpdateCompanion<DatabaseCard> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> meaning;
  final Value<String> pronunciation;
  final Value<String> level;
  final Value<String> collocation;
  final Value<String> example;
  final Value<String> origin;
  final Value<int> memorizedType;
  const DatabaseCardsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.meaning = const Value.absent(),
    this.pronunciation = const Value.absent(),
    this.level = const Value.absent(),
    this.collocation = const Value.absent(),
    this.example = const Value.absent(),
    this.origin = const Value.absent(),
    this.memorizedType = const Value.absent(),
  });
  DatabaseCardsCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required String meaning,
    required String pronunciation,
    required String level,
    required String collocation,
    required String example,
    required String origin,
    required int memorizedType,
  })  : word = Value(word),
        meaning = Value(meaning),
        pronunciation = Value(pronunciation),
        level = Value(level),
        collocation = Value(collocation),
        example = Value(example),
        origin = Value(origin),
        memorizedType = Value(memorizedType);
  static Insertable<DatabaseCard> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? meaning,
    Expression<String>? pronunciation,
    Expression<String>? level,
    Expression<String>? collocation,
    Expression<String>? example,
    Expression<String>? origin,
    Expression<int>? memorizedType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (meaning != null) 'meaning': meaning,
      if (pronunciation != null) 'pronunciation': pronunciation,
      if (level != null) 'level': level,
      if (collocation != null) 'collocation': collocation,
      if (example != null) 'example': example,
      if (origin != null) 'origin': origin,
      if (memorizedType != null) 'memorized_type': memorizedType,
    });
  }

  DatabaseCardsCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? meaning,
      Value<String>? pronunciation,
      Value<String>? level,
      Value<String>? collocation,
      Value<String>? example,
      Value<String>? origin,
      Value<int>? memorizedType}) {
    return DatabaseCardsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      meaning: meaning ?? this.meaning,
      pronunciation: pronunciation ?? this.pronunciation,
      level: level ?? this.level,
      collocation: collocation ?? this.collocation,
      example: example ?? this.example,
      origin: origin ?? this.origin,
      memorizedType: memorizedType ?? this.memorizedType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (pronunciation.present) {
      map['pronunciation'] = Variable<String>(pronunciation.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (collocation.present) {
      map['collocation'] = Variable<String>(collocation.value);
    }
    if (example.present) {
      map['example'] = Variable<String>(example.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (memorizedType.present) {
      map['memorized_type'] = Variable<int>(memorizedType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseCardsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('meaning: $meaning, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('level: $level, ')
          ..write('collocation: $collocation, ')
          ..write('example: $example, ')
          ..write('origin: $origin, ')
          ..write('memorizedType: $memorizedType')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyCardDatabase extends GeneratedDatabase {
  _$MyCardDatabase(QueryExecutor e) : super(e);
  late final $DatabaseCardsTable databaseCards = $DatabaseCardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [databaseCards];
}
