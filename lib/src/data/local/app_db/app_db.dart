import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'work_time_items_table.dart';

part 'app_db.g.dart';
//
// LazyDatabase _openConnection (){
//   return LazyDatabase(() async{
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(path.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//   });
// }


// @DriftDatabase(tables: [WorkTimeItems])
// class AppDB extends _$AppDB{
//
//   // AppDB() : super(_openConnection());
//
//   @override
//   int get schemaVersion =>1;
//
//   Future<List<WorkTimeItem>> getTimes() async{
//     return await select(workTimeItems).get();
//   }
//
//   Future<bool> updateWorkTime(WorkTimeItemsCompanion entity) async{
//     return await update(workTimeItems).replace(entity);
//   }
//
//   Future<int> insertWorkTime(WorkTimeItemsCompanion entity) async{
//     return await into(workTimeItems).insert(entity);
//   }
//
//   Future<int> deleteWorkTime(int id) async{
//     return await (delete(workTimeItems)..where((tbl) => tbl.id.equals(id))).go();
//   }
// }