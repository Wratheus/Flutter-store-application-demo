import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


part 'database.g.dart';

class UserCart extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer()();
  TextColumn get title => text()();
  TextColumn get imageUrl => text()();
  TextColumn get itemSize => text()();
  TextColumn get itemPrice => text()();
  TextColumn get itemColor => text()();
  IntColumn get itemCount => integer()();
}

@DriftDatabase(tables: [UserCart])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

