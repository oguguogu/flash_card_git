import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'database_books.g.dart';

// 以下の定義の場合だと"todos"というテーブルが作成される。
// 行単位のデータは"Todoクラス"になる。
// 　※Todoクラスはこの後の工程で自動で作成される。
class DatabaseBooks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text().withLength(min: 2, max: 15)();
  TextColumn get meaning => text()();
  TextColumn get partOfSpeech => text()();
  TextColumn get pronunciation => text()();
  TextColumn get level => text()();
  TextColumn get collocation => text()();
  TextColumn get example => text()();
  TextColumn get derivatives => text()();
  TextColumn get origin => text()();
  IntColumn get memorizedType => integer()();
}

// DriftDatabaseに上記の2テーブルを指定して、Driftで扱えるよう設定する。
// 今のタイミングではMyDatabeseクラスは空で良い。
// "_$MyDatabase"が存在しないと怒られるが気にしない。
@DriftDatabase(tables: [DatabaseBooks])
class MyBookDatabase extends _$MyBookDatabase {
  static final MyBookDatabase _instance = MyBookDatabase._internal();

  factory MyBookDatabase() {
    return _instance;
  }
  MyBookDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //Streamでデータを監視して表示するためのメソッド
  Stream<List<DatabaseBook>> watchEntries() {
    return (select(databaseBooks)).watch();
  }

  //Futureでデータを一気に取得して表示するためのメソッド
  Future<List<DatabaseBook>> get allDatabaseCardEntries =>
      select(databaseBooks).get();

  // Future<List<String>> get allWords =>
  //     select(databaseCards).map((row) => row.word).get();

  //検索するためのメソッド
  Future<bool> wordExists(String word) async {
    final queryResult = await (select(databaseBooks)
          ..where((tbl) => tbl.word.equals(word)))
        .get();
    return queryResult.isNotEmpty;
  }

  //データを追加するためのメソッド
  Future<int> addDatabaseCard(
    String word,
    String meaning,
    String partOfSpeech,
    String pronunciation,
    String level,
    String collocation,
    String example,
    String derivatives,
    String origin,
    int memorizedType,
  ) {
    return into(databaseBooks).insert(
      DatabaseBooksCompanion(
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
      ),
    );
  }

  Future<int> updateDatabaseCard(String collocationKey, int memorizedType) {
    return (update(databaseBooks)
          ..where((tbl) => tbl.collocation.equals(collocationKey)))
        .write(
      DatabaseBooksCompanion(
        memorizedType: Value(memorizedType),
      ),
    );
  }

  Future<void> deleteDatabaseCard(String word) {
    return (delete(databaseBooks)
          ..where((tbl) => tbl.word.equals(word) | tbl.meaning.equals(word)))
        .go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'english_db.sqlite'));
    return NativeDatabase(file);
  });
}
