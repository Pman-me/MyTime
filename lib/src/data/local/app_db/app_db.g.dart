// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WorkTimeItem extends DataClass implements Insertable<WorkTimeItem> {
  final int id;
  final String? description;
  final String workspaceId;
  final String projectId;
  final String taskId;
  final DateTime dateOfStart;
  final DateTime dateOfEnd;
  const WorkTimeItem(
      {required this.id,
      this.description,
      required this.workspaceId,
      required this.projectId,
      required this.taskId,
      required this.dateOfStart,
      required this.dateOfEnd});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['workspace_id'] = Variable<String>(workspaceId);
    map['project_id'] = Variable<String>(projectId);
    map['task_id'] = Variable<String>(taskId);
    map['date_of_start'] = Variable<DateTime>(dateOfStart);
    map['end_of_start'] = Variable<DateTime>(dateOfEnd);
    return map;
  }

  WorkTimeItemsCompanion toCompanion(bool nullToAbsent) {
    return WorkTimeItemsCompanion(
      id: Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      workspaceId: Value(workspaceId),
      projectId: Value(projectId),
      taskId: Value(taskId),
      dateOfStart: Value(dateOfStart),
      dateOfEnd: Value(dateOfEnd),
    );
  }

  factory WorkTimeItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkTimeItem(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String?>(json['description']),
      workspaceId: serializer.fromJson<String>(json['workspaceId']),
      projectId: serializer.fromJson<String>(json['projectId']),
      taskId: serializer.fromJson<String>(json['taskId']),
      dateOfStart: serializer.fromJson<DateTime>(json['dateOfStart']),
      dateOfEnd: serializer.fromJson<DateTime>(json['dateOfEnd']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String?>(description),
      'workspaceId': serializer.toJson<String>(workspaceId),
      'projectId': serializer.toJson<String>(projectId),
      'taskId': serializer.toJson<String>(taskId),
      'dateOfStart': serializer.toJson<DateTime>(dateOfStart),
      'dateOfEnd': serializer.toJson<DateTime>(dateOfEnd),
    };
  }

  WorkTimeItem copyWith(
          {int? id,
          Value<String?> description = const Value.absent(),
          String? workspaceId,
          String? projectId,
          String? taskId,
          DateTime? dateOfStart,
          DateTime? dateOfEnd}) =>
      WorkTimeItem(
        id: id ?? this.id,
        description: description.present ? description.value : this.description,
        workspaceId: workspaceId ?? this.workspaceId,
        projectId: projectId ?? this.projectId,
        taskId: taskId ?? this.taskId,
        dateOfStart: dateOfStart ?? this.dateOfStart,
        dateOfEnd: dateOfEnd ?? this.dateOfEnd,
      );
  @override
  String toString() {
    return (StringBuffer('WorkTimeItem(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('projectId: $projectId, ')
          ..write('taskId: $taskId, ')
          ..write('dateOfStart: $dateOfStart, ')
          ..write('dateOfEnd: $dateOfEnd')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, description, workspaceId, projectId, taskId, dateOfStart, dateOfEnd);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkTimeItem &&
          other.id == this.id &&
          other.description == this.description &&
          other.workspaceId == this.workspaceId &&
          other.projectId == this.projectId &&
          other.taskId == this.taskId &&
          other.dateOfStart == this.dateOfStart &&
          other.dateOfEnd == this.dateOfEnd);
}

class WorkTimeItemsCompanion extends UpdateCompanion<WorkTimeItem> {
  final Value<int> id;
  final Value<String?> description;
  final Value<String> workspaceId;
  final Value<String> projectId;
  final Value<String> taskId;
  final Value<DateTime> dateOfStart;
  final Value<DateTime> dateOfEnd;
  const WorkTimeItemsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.workspaceId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.taskId = const Value.absent(),
    this.dateOfStart = const Value.absent(),
    this.dateOfEnd = const Value.absent(),
  });
  WorkTimeItemsCompanion.insert({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    required String workspaceId,
    required String projectId,
    required String taskId,
    required DateTime dateOfStart,
    required DateTime dateOfEnd,
  })  : workspaceId = Value(workspaceId),
        projectId = Value(projectId),
        taskId = Value(taskId),
        dateOfStart = Value(dateOfStart),
        dateOfEnd = Value(dateOfEnd);
  static Insertable<WorkTimeItem> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<String>? workspaceId,
    Expression<String>? projectId,
    Expression<String>? taskId,
    Expression<DateTime>? dateOfStart,
    Expression<DateTime>? dateOfEnd,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (workspaceId != null) 'workspace_id': workspaceId,
      if (projectId != null) 'project_id': projectId,
      if (taskId != null) 'task_id': taskId,
      if (dateOfStart != null) 'date_of_start': dateOfStart,
      if (dateOfEnd != null) 'end_of_start': dateOfEnd,
    });
  }

  WorkTimeItemsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? description,
      Value<String>? workspaceId,
      Value<String>? projectId,
      Value<String>? taskId,
      Value<DateTime>? dateOfStart,
      Value<DateTime>? dateOfEnd}) {
    return WorkTimeItemsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      workspaceId: workspaceId ?? this.workspaceId,
      projectId: projectId ?? this.projectId,
      taskId: taskId ?? this.taskId,
      dateOfStart: dateOfStart ?? this.dateOfStart,
      dateOfEnd: dateOfEnd ?? this.dateOfEnd,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (workspaceId.present) {
      map['workspace_id'] = Variable<String>(workspaceId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (dateOfStart.present) {
      map['date_of_start'] = Variable<DateTime>(dateOfStart.value);
    }
    if (dateOfEnd.present) {
      map['end_of_start'] = Variable<DateTime>(dateOfEnd.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkTimeItemsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('projectId: $projectId, ')
          ..write('taskId: $taskId, ')
          ..write('dateOfStart: $dateOfStart, ')
          ..write('dateOfEnd: $dateOfEnd')
          ..write(')'))
        .toString();
  }
}

class $WorkTimeItemsTable extends WorkTimeItems
    with TableInfo<$WorkTimeItemsTable, WorkTimeItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkTimeItemsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _workspaceIdMeta =
      const VerificationMeta('workspaceId');
  @override
  late final GeneratedColumn<String> workspaceId = GeneratedColumn<String>(
      'workspace_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _projectIdMeta = const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
      'task_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _dateOfStartMeta =
      const VerificationMeta('dateOfStart');
  @override
  late final GeneratedColumn<DateTime> dateOfStart = GeneratedColumn<DateTime>(
      'date_of_start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _dateOfEndMeta = const VerificationMeta('dateOfEnd');
  @override
  late final GeneratedColumn<DateTime> dateOfEnd = GeneratedColumn<DateTime>(
      'end_of_start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, workspaceId, projectId, taskId, dateOfStart, dateOfEnd];
  @override
  String get aliasedName => _alias ?? 'work_time_items';
  @override
  String get actualTableName => 'work_time_items';
  @override
  VerificationContext validateIntegrity(Insertable<WorkTimeItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('workspace_id')) {
      context.handle(
          _workspaceIdMeta,
          workspaceId.isAcceptableOrUnknown(
              data['workspace_id']!, _workspaceIdMeta));
    } else if (isInserting) {
      context.missing(_workspaceIdMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('date_of_start')) {
      context.handle(
          _dateOfStartMeta,
          dateOfStart.isAcceptableOrUnknown(
              data['date_of_start']!, _dateOfStartMeta));
    } else if (isInserting) {
      context.missing(_dateOfStartMeta);
    }
    if (data.containsKey('end_of_start')) {
      context.handle(
          _dateOfEndMeta,
          dateOfEnd.isAcceptableOrUnknown(
              data['end_of_start']!, _dateOfEndMeta));
    } else if (isInserting) {
      context.missing(_dateOfEndMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkTimeItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkTimeItem(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      workspaceId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}workspace_id'])!,
      projectId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      taskId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}task_id'])!,
      dateOfStart: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_start'])!,
      dateOfEnd: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_of_start'])!,
    );
  }

  @override
  $WorkTimeItemsTable createAlias(String alias) {
    return $WorkTimeItemsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(e);
  late final $WorkTimeItemsTable workTimeItems = $WorkTimeItemsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [workTimeItems];
}
