// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// ignore_for_file: type=lint
class $JournalTableTable extends JournalTable
    with TableInfo<$JournalTableTable, JournalTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeSinceLastEntryMeta =
      const VerificationMeta('timeSinceLastEntry');
  @override
  late final GeneratedColumn<int> timeSinceLastEntry = GeneratedColumn<int>(
      'time_since_last_entry', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updateTimeMeta =
      const VerificationMeta('updateTime');
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
      'update_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, timeSinceLastEntry, createTime, updateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_table';
  @override
  VerificationContext validateIntegrity(Insertable<JournalTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('time_since_last_entry')) {
      context.handle(
          _timeSinceLastEntryMeta,
          timeSinceLastEntry.isAcceptableOrUnknown(
              data['time_since_last_entry']!, _timeSinceLastEntryMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _updateTimeMeta,
          updateTime.isAcceptableOrUnknown(
              data['update_time']!, _updateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      timeSinceLastEntry: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_since_last_entry']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
    );
  }

  @override
  $JournalTableTable createAlias(String alias) {
    return $JournalTableTable(attachedDatabase, alias);
  }
}

class JournalTableData extends DataClass
    implements Insertable<JournalTableData> {
  final int id;
  final String? title;
  final String content;
  final int? timeSinceLastEntry;
  final DateTime createTime;
  final DateTime updateTime;
  const JournalTableData(
      {required this.id,
      this.title,
      required this.content,
      this.timeSinceLastEntry,
      required this.createTime,
      required this.updateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || timeSinceLastEntry != null) {
      map['time_since_last_entry'] = Variable<int>(timeSinceLastEntry);
    }
    map['create_time'] = Variable<DateTime>(createTime);
    map['update_time'] = Variable<DateTime>(updateTime);
    return map;
  }

  JournalTableCompanion toCompanion(bool nullToAbsent) {
    return JournalTableCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: Value(content),
      timeSinceLastEntry: timeSinceLastEntry == null && nullToAbsent
          ? const Value.absent()
          : Value(timeSinceLastEntry),
      createTime: Value(createTime),
      updateTime: Value(updateTime),
    );
  }

  factory JournalTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      timeSinceLastEntry: serializer.fromJson<int?>(json['timeSinceLastEntry']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime>(json['updateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'content': serializer.toJson<String>(content),
      'timeSinceLastEntry': serializer.toJson<int?>(timeSinceLastEntry),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime>(updateTime),
    };
  }

  JournalTableData copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          String? content,
          Value<int?> timeSinceLastEntry = const Value.absent(),
          DateTime? createTime,
          DateTime? updateTime}) =>
      JournalTableData(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        content: content ?? this.content,
        timeSinceLastEntry: timeSinceLastEntry.present
            ? timeSinceLastEntry.value
            : this.timeSinceLastEntry,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime ?? this.updateTime,
      );
  @override
  String toString() {
    return (StringBuffer('JournalTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('timeSinceLastEntry: $timeSinceLastEntry, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, content, timeSinceLastEntry, createTime, updateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.timeSinceLastEntry == this.timeSinceLastEntry &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime);
}

class JournalTableCompanion extends UpdateCompanion<JournalTableData> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String> content;
  final Value<int?> timeSinceLastEntry;
  final Value<DateTime> createTime;
  final Value<DateTime> updateTime;
  const JournalTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.timeSinceLastEntry = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
  });
  JournalTableCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    required String content,
    this.timeSinceLastEntry = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
  }) : content = Value(content);
  static Insertable<JournalTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? timeSinceLastEntry,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (timeSinceLastEntry != null)
        'time_since_last_entry': timeSinceLastEntry,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
    });
  }

  JournalTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String>? content,
      Value<int?>? timeSinceLastEntry,
      Value<DateTime>? createTime,
      Value<DateTime>? updateTime}) {
    return JournalTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      timeSinceLastEntry: timeSinceLastEntry ?? this.timeSinceLastEntry,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (timeSinceLastEntry.present) {
      map['time_since_last_entry'] = Variable<int>(timeSinceLastEntry.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('timeSinceLastEntry: $timeSinceLastEntry, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$JournalDatabase extends GeneratedDatabase {
  _$JournalDatabase(QueryExecutor e) : super(e);
  _$JournalDatabaseManager get managers => _$JournalDatabaseManager(this);
  late final $JournalTableTable journalTable = $JournalTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [journalTable];
}

typedef $$JournalTableTableInsertCompanionBuilder = JournalTableCompanion
    Function({
  Value<int> id,
  Value<String?> title,
  required String content,
  Value<int?> timeSinceLastEntry,
  Value<DateTime> createTime,
  Value<DateTime> updateTime,
});
typedef $$JournalTableTableUpdateCompanionBuilder = JournalTableCompanion
    Function({
  Value<int> id,
  Value<String?> title,
  Value<String> content,
  Value<int?> timeSinceLastEntry,
  Value<DateTime> createTime,
  Value<DateTime> updateTime,
});

class $$JournalTableTableTableManager extends RootTableManager<
    _$JournalDatabase,
    $JournalTableTable,
    JournalTableData,
    $$JournalTableTableFilterComposer,
    $$JournalTableTableOrderingComposer,
    $$JournalTableTableProcessedTableManager,
    $$JournalTableTableInsertCompanionBuilder,
    $$JournalTableTableUpdateCompanionBuilder> {
  $$JournalTableTableTableManager(
      _$JournalDatabase db, $JournalTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$JournalTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$JournalTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$JournalTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<int?> timeSinceLastEntry = const Value.absent(),
            Value<DateTime> createTime = const Value.absent(),
            Value<DateTime> updateTime = const Value.absent(),
          }) =>
              JournalTableCompanion(
            id: id,
            title: title,
            content: content,
            timeSinceLastEntry: timeSinceLastEntry,
            createTime: createTime,
            updateTime: updateTime,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            required String content,
            Value<int?> timeSinceLastEntry = const Value.absent(),
            Value<DateTime> createTime = const Value.absent(),
            Value<DateTime> updateTime = const Value.absent(),
          }) =>
              JournalTableCompanion.insert(
            id: id,
            title: title,
            content: content,
            timeSinceLastEntry: timeSinceLastEntry,
            createTime: createTime,
            updateTime: updateTime,
          ),
        ));
}

class $$JournalTableTableProcessedTableManager extends ProcessedTableManager<
    _$JournalDatabase,
    $JournalTableTable,
    JournalTableData,
    $$JournalTableTableFilterComposer,
    $$JournalTableTableOrderingComposer,
    $$JournalTableTableProcessedTableManager,
    $$JournalTableTableInsertCompanionBuilder,
    $$JournalTableTableUpdateCompanionBuilder> {
  $$JournalTableTableProcessedTableManager(super.$state);
}

class $$JournalTableTableFilterComposer
    extends FilterComposer<_$JournalDatabase, $JournalTableTable> {
  $$JournalTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timeSinceLastEntry => $state.composableBuilder(
      column: $state.table.timeSinceLastEntry,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updateTime => $state.composableBuilder(
      column: $state.table.updateTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$JournalTableTableOrderingComposer
    extends OrderingComposer<_$JournalDatabase, $JournalTableTable> {
  $$JournalTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timeSinceLastEntry => $state.composableBuilder(
      column: $state.table.timeSinceLastEntry,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updateTime => $state.composableBuilder(
      column: $state.table.updateTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$JournalDatabaseManager {
  final _$JournalDatabase _db;
  _$JournalDatabaseManager(this._db);
  $$JournalTableTableTableManager get journalTable =>
      $$JournalTableTableTableManager(_db, _db.journalTable);
}
