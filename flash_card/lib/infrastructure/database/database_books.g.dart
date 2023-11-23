// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_books.dart';

// ignore_for_file: type=lint
class $DatabaseBooksTable extends DatabaseBooks
    with TableInfo<$DatabaseBooksTable, DatabaseBook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DatabaseBooksTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _partOfSpeechMeta =
      const VerificationMeta('partOfSpeech');
  @override
  late final GeneratedColumn<String> partOfSpeech = GeneratedColumn<String>(
      'part_of_speech', aliasedName, false,
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
  static const VerificationMeta _derivativesMeta =
      const VerificationMeta('derivatives');
  @override
  late final GeneratedColumn<String> derivatives = GeneratedColumn<String>(
      'derivatives', aliasedName, false,
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
        partOfSpeech,
        pronunciation,
        level,
        collocation,
        example,
        derivatives,
        origin,
        memorizedType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'database_books';
  @override
  VerificationContext validateIntegrity(Insertable<DatabaseBook> instance,
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
    if (data.containsKey('part_of_speech')) {
      context.handle(
          _partOfSpeechMeta,
          partOfSpeech.isAcceptableOrUnknown(
              data['part_of_speech']!, _partOfSpeechMeta));
    } else if (isInserting) {
      context.missing(_partOfSpeechMeta);
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
    if (data.containsKey('derivatives')) {
      context.handle(
          _derivativesMeta,
          derivatives.isAcceptableOrUnknown(
              data['derivatives']!, _derivativesMeta));
    } else if (isInserting) {
      context.missing(_derivativesMeta);
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
  DatabaseBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DatabaseBook(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      meaning: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning'])!,
      partOfSpeech: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}part_of_speech'])!,
      pronunciation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pronunciation'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      collocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collocation'])!,
      example: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}example'])!,
      derivatives: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}derivatives'])!,
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin'])!,
      memorizedType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}memorized_type'])!,
    );
  }

  @override
  $DatabaseBooksTable createAlias(String alias) {
    return $DatabaseBooksTable(attachedDatabase, alias);
  }
}

class DatabaseBook extends DataClass implements Insertable<DatabaseBook> {
  final int id;
  final String word;
  final String meaning;
  final String partOfSpeech;
  final String pronunciation;
  final String level;
  final String collocation;
  final String example;
  final String derivatives;
  final String origin;
  final int memorizedType;
  const DatabaseBook(
      {required this.id,
      required this.word,
      required this.meaning,
      required this.partOfSpeech,
      required this.pronunciation,
      required this.level,
      required this.collocation,
      required this.example,
      required this.derivatives,
      required this.origin,
      required this.memorizedType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['meaning'] = Variable<String>(meaning);
    map['part_of_speech'] = Variable<String>(partOfSpeech);
    map['pronunciation'] = Variable<String>(pronunciation);
    map['level'] = Variable<String>(level);
    map['collocation'] = Variable<String>(collocation);
    map['example'] = Variable<String>(example);
    map['derivatives'] = Variable<String>(derivatives);
    map['origin'] = Variable<String>(origin);
    map['memorized_type'] = Variable<int>(memorizedType);
    return map;
  }

  DatabaseBooksCompanion toCompanion(bool nullToAbsent) {
    return DatabaseBooksCompanion(
      id: Value(id),
      word: Value(word),
      meaning: Value(meaning),
      partOfSpeech: Value(partOfSpeech),
      pronunciation: Value(pronunciation),
      level: Value(level),
      collocation: Value(collocation),
      example: Value(example),
      derivatives: Value(derivatives),
      origin: Value(origin),
      memorizedType: Value(memorizedType),
    );
  }

  factory DatabaseBook.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DatabaseBook(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      meaning: serializer.fromJson<String>(json['meaning']),
      partOfSpeech: serializer.fromJson<String>(json['partOfSpeech']),
      pronunciation: serializer.fromJson<String>(json['pronunciation']),
      level: serializer.fromJson<String>(json['level']),
      collocation: serializer.fromJson<String>(json['collocation']),
      example: serializer.fromJson<String>(json['example']),
      derivatives: serializer.fromJson<String>(json['derivatives']),
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
      'partOfSpeech': serializer.toJson<String>(partOfSpeech),
      'pronunciation': serializer.toJson<String>(pronunciation),
      'level': serializer.toJson<String>(level),
      'collocation': serializer.toJson<String>(collocation),
      'example': serializer.toJson<String>(example),
      'derivatives': serializer.toJson<String>(derivatives),
      'origin': serializer.toJson<String>(origin),
      'memorizedType': serializer.toJson<int>(memorizedType),
    };
  }

  DatabaseBook copyWith(
          {int? id,
          String? word,
          String? meaning,
          String? partOfSpeech,
          String? pronunciation,
          String? level,
          String? collocation,
          String? example,
          String? derivatives,
          String? origin,
          int? memorizedType}) =>
      DatabaseBook(
        id: id ?? this.id,
        word: word ?? this.word,
        meaning: meaning ?? this.meaning,
        partOfSpeech: partOfSpeech ?? this.partOfSpeech,
        pronunciation: pronunciation ?? this.pronunciation,
        level: level ?? this.level,
        collocation: collocation ?? this.collocation,
        example: example ?? this.example,
        derivatives: derivatives ?? this.derivatives,
        origin: origin ?? this.origin,
        memorizedType: memorizedType ?? this.memorizedType,
      );
  @override
  String toString() {
    return (StringBuffer('DatabaseBook(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('meaning: $meaning, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('level: $level, ')
          ..write('collocation: $collocation, ')
          ..write('example: $example, ')
          ..write('derivatives: $derivatives, ')
          ..write('origin: $origin, ')
          ..write('memorizedType: $memorizedType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      word,
      meaning,
      partOfSpeech,
      pronunciation,
      level,
      collocation,
      example,
      derivatives,
      origin,
      memorizedType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DatabaseBook &&
          other.id == this.id &&
          other.word == this.word &&
          other.meaning == this.meaning &&
          other.partOfSpeech == this.partOfSpeech &&
          other.pronunciation == this.pronunciation &&
          other.level == this.level &&
          other.collocation == this.collocation &&
          other.example == this.example &&
          other.derivatives == this.derivatives &&
          other.origin == this.origin &&
          other.memorizedType == this.memorizedType);
}

class DatabaseBooksCompanion extends UpdateCompanion<DatabaseBook> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> meaning;
  final Value<String> partOfSpeech;
  final Value<String> pronunciation;
  final Value<String> level;
  final Value<String> collocation;
  final Value<String> example;
  final Value<String> derivatives;
  final Value<String> origin;
  final Value<int> memorizedType;
  const DatabaseBooksCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.meaning = const Value.absent(),
    this.partOfSpeech = const Value.absent(),
    this.pronunciation = const Value.absent(),
    this.level = const Value.absent(),
    this.collocation = const Value.absent(),
    this.example = const Value.absent(),
    this.derivatives = const Value.absent(),
    this.origin = const Value.absent(),
    this.memorizedType = const Value.absent(),
  });
  DatabaseBooksCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required String meaning,
    required String partOfSpeech,
    required String pronunciation,
    required String level,
    required String collocation,
    required String example,
    required String derivatives,
    required String origin,
    required int memorizedType,
  })  : word = Value(word),
        meaning = Value(meaning),
        partOfSpeech = Value(partOfSpeech),
        pronunciation = Value(pronunciation),
        level = Value(level),
        collocation = Value(collocation),
        example = Value(example),
        derivatives = Value(derivatives),
        origin = Value(origin),
        memorizedType = Value(memorizedType);
  static Insertable<DatabaseBook> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? meaning,
    Expression<String>? partOfSpeech,
    Expression<String>? pronunciation,
    Expression<String>? level,
    Expression<String>? collocation,
    Expression<String>? example,
    Expression<String>? derivatives,
    Expression<String>? origin,
    Expression<int>? memorizedType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (meaning != null) 'meaning': meaning,
      if (partOfSpeech != null) 'part_of_speech': partOfSpeech,
      if (pronunciation != null) 'pronunciation': pronunciation,
      if (level != null) 'level': level,
      if (collocation != null) 'collocation': collocation,
      if (example != null) 'example': example,
      if (derivatives != null) 'derivatives': derivatives,
      if (origin != null) 'origin': origin,
      if (memorizedType != null) 'memorized_type': memorizedType,
    });
  }

  DatabaseBooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? meaning,
      Value<String>? partOfSpeech,
      Value<String>? pronunciation,
      Value<String>? level,
      Value<String>? collocation,
      Value<String>? example,
      Value<String>? derivatives,
      Value<String>? origin,
      Value<int>? memorizedType}) {
    return DatabaseBooksCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      meaning: meaning ?? this.meaning,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      pronunciation: pronunciation ?? this.pronunciation,
      level: level ?? this.level,
      collocation: collocation ?? this.collocation,
      example: example ?? this.example,
      derivatives: derivatives ?? this.derivatives,
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
    if (partOfSpeech.present) {
      map['part_of_speech'] = Variable<String>(partOfSpeech.value);
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
    if (derivatives.present) {
      map['derivatives'] = Variable<String>(derivatives.value);
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
    return (StringBuffer('DatabaseBooksCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('meaning: $meaning, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('level: $level, ')
          ..write('collocation: $collocation, ')
          ..write('example: $example, ')
          ..write('derivatives: $derivatives, ')
          ..write('origin: $origin, ')
          ..write('memorizedType: $memorizedType')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyBookDatabase extends GeneratedDatabase {
  _$MyBookDatabase(QueryExecutor e) : super(e);
  late final $DatabaseBooksTable databaseBooks = $DatabaseBooksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [databaseBooks];
}
