import 'package:drift/drift.dart';

class WorkTimeItems extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().nullable()();
  TextColumn get workspaceId => text().named('workspace_id')();
  TextColumn get projectId => text().named('project_id')();
  TextColumn get taskId => text().named('task_id')();
  DateTimeColumn get dateOfStart => dateTime().named('date_of_start')();
  DateTimeColumn get dateOfEnd => dateTime().named('end_of_start')();
}