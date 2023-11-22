import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'database_cards.g.dart';

// 以下の定義の場合だと"todos"というテーブルが作成される。
// 行単位のデータは"Todoクラス"になる。
// 　※Todoクラスはこの後の工程で自動で作成される。
class DatabaseCards extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text().withLength(min: 2, max: 15)();
  TextColumn get meaning => text()();
  TextColumn get pronunciation => text()();
  TextColumn get level => text()();
  TextColumn get collocation => text()();
  TextColumn get example => text()();
  TextColumn get origin => text()();
  IntColumn get memorizedType => integer()();
}

// DriftDatabaseに上記の2テーブルを指定して、Driftで扱えるよう設定する。
// 今のタイミングではMyDatabeseクラスは空で良い。
// "_$MyDatabase"が存在しないと怒られるが気にしない。
@DriftDatabase(tables: [DatabaseCards])
class MyCardDatabase extends _$MyCardDatabase {
  static final MyCardDatabase _instance = MyCardDatabase._internal();

  factory MyCardDatabase() {
    return _instance;
  }
  MyCardDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //Streamでデータを監視して表示するためのメソッド
  Stream<List<DatabaseCard>> watchEntries() {
    return (select(databaseCards)).watch();
  }

  //Futureでデータを一気に取得して表示するためのメソッド
  Future<List<DatabaseCard>> get allDatabaseCardEntries =>
      select(databaseCards).get();

  // Future<List<String>> get allWords =>
  //     select(databaseCards).map((row) => row.word).get();

  //検索するためのメソッド
  Future<bool> wordExists(String word) async {
    final queryResult = await (select(databaseCards)
          ..where((tbl) => tbl.word.equals(word)))
        .get();
    return queryResult.isNotEmpty;
  }

  //データを追加するためのメソッド
  Future<int> addDatabaseCard(
    String word,
    String meaning,
    String pronunciation,
    String level,
    String collocation,
    String example,
    String origin,
    int memorizedType,
  ) {
    return into(databaseCards).insert(
      DatabaseCardsCompanion(
        word: Value(word),
        meaning: Value(meaning),
        pronunciation: Value(pronunciation),
        level: Value(level),
        collocation: Value(collocation),
        example: Value(example),
        origin: Value(origin),
        memorizedType: Value(memorizedType),
      ),
    );
  }

  Future<int> updateDatabaseCard(String collocationKey, int memorizedType) {
    return (update(databaseCards)
          ..where((tbl) => tbl.collocation.equals(collocationKey)))
        .write(
      DatabaseCardsCompanion(
        memorizedType: Value(memorizedType),
      ),
    );
  }

  Future<void> deleteDatabaseCard(String word) {
    return (delete(databaseCards)
          ..where((tbl) => tbl.word.equals(word) | tbl.meaning.equals(word)))
        .go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'card_db.sqlite'));
    return NativeDatabase(file);
  });
}
