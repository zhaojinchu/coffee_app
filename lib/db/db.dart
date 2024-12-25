import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// DriftDatabase annotation and table definitions
part 'db.g.dart';

class CoffeeInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get tastingNotes => text()();
  IntColumn get rating => integer()();

}

@DriftDatabase(tables: [CoffeeInfo])
class Db extends _$Db {
  Db() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(p.join(folder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });}
}