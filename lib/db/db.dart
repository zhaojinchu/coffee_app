import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

class CoffeeInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get tastingNotes => text()();
  IntColumn get rating => integer()();
  // TODO: Add country field, and look at other stuff to add
}

@DriftDatabase(tables: [CoffeeInfo])
class Db extends _$Db {
  Db._internal() : super(_openConnection());

  static final Db _instance = Db._internal();

  factory Db() {
    return _instance;
  }

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final folder = await getApplicationDocumentsDirectory();
      final file = File(p.join(folder.path, 'db.sqlite'));
      return NativeDatabase(file, logStatements: true);
    });
  }


  // Query Methods
  Future<List<CoffeeInfoData>> getSortedEntriesByName() async {
    try {
      print('Executing query: SELECT * FROM coffee_info ORDER BY name ASC');
      return (select(coffeeInfo)
            ..orderBy([(entry) => OrderingTerm(expression: entry.name)]))
          .get();
    } catch (e) {
      print('Error in getSortedEntriesByName: $e');
      return [];
    }
  }

  Future<List<CoffeeInfoData>> getSortedEntriesByRating() async {
    try {
      print('Executing query: SELECT * FROM coffee_info ORDER BY rating ASC');
      return (select(coffeeInfo)
            ..orderBy([(entry) => OrderingTerm(expression: entry.rating)]))
          .get();
    } catch (e) {
      print('Error in getSortedEntriesByRating: $e');
      return [];
    }
  }

  Future<void> updateCoffeeEntry(CoffeeInfoCompanion updatedEntry) async {
    try {
      // Perform the update operation
      await (update(coffeeInfo)
            ..where((tbl) => tbl.id.equals(updatedEntry.id.value)))
          .write(updatedEntry);

      print('Entry updated successfully: $updatedEntry');
    } catch (e) {
      print('Error updating entry: $e');
      rethrow; // Re-throw the error to be handled by the caller
    }
  }




  // Debugging methods
  Future<void> checkDatabaseExists() async {
    final folder = await getApplicationDocumentsDirectory();
    final dbPath = p.join(folder.path, 'db.sqlite');
    if (await File(dbPath).exists()) {
      print('Database exists at $dbPath');
    } else {
      print('Database does not exist at $dbPath');
    }
  }

  Future<void> checkTableStructure() async {
    try {
      final result = await customSelect('PRAGMA table_info(coffee_info)').get();
      print('Table structure: $result');
    } catch (e) {
      print('Error checking table structure: $e');
    }
    
  }

  Future<void> testSimpleQuery() async {
    try {
      final result = await customSelect('SELECT * FROM coffee_info LIMIT 1').get();
      for (final row in result) {
        print('Row: ${row.data}');
      }
    } catch (e) {
      print('Error in test query: $e');
    }
  }


}
