// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $CoffeeInfoTable extends CoffeeInfo
    with TableInfo<$CoffeeInfoTable, CoffeeInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoffeeInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tastingNotesMeta =
      const VerificationMeta('tastingNotes');
  @override
  late final GeneratedColumn<String> tastingNotes = GeneratedColumn<String>(
      'tasting_notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, tastingNotes, rating];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'coffee_info';
  @override
  VerificationContext validateIntegrity(Insertable<CoffeeInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tasting_notes')) {
      context.handle(
          _tastingNotesMeta,
          tastingNotes.isAcceptableOrUnknown(
              data['tasting_notes']!, _tastingNotesMeta));
    } else if (isInserting) {
      context.missing(_tastingNotesMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoffeeInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoffeeInfoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      tastingNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tasting_notes'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
    );
  }

  @override
  $CoffeeInfoTable createAlias(String alias) {
    return $CoffeeInfoTable(attachedDatabase, alias);
  }
}

class CoffeeInfoData extends DataClass implements Insertable<CoffeeInfoData> {
  final int id;
  final String name;
  final String tastingNotes;
  final int rating;
  const CoffeeInfoData(
      {required this.id,
      required this.name,
      required this.tastingNotes,
      required this.rating});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['tasting_notes'] = Variable<String>(tastingNotes);
    map['rating'] = Variable<int>(rating);
    return map;
  }

  CoffeeInfoCompanion toCompanion(bool nullToAbsent) {
    return CoffeeInfoCompanion(
      id: Value(id),
      name: Value(name),
      tastingNotes: Value(tastingNotes),
      rating: Value(rating),
    );
  }

  factory CoffeeInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoffeeInfoData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      tastingNotes: serializer.fromJson<String>(json['tastingNotes']),
      rating: serializer.fromJson<int>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'tastingNotes': serializer.toJson<String>(tastingNotes),
      'rating': serializer.toJson<int>(rating),
    };
  }

  CoffeeInfoData copyWith(
          {int? id, String? name, String? tastingNotes, int? rating}) =>
      CoffeeInfoData(
        id: id ?? this.id,
        name: name ?? this.name,
        tastingNotes: tastingNotes ?? this.tastingNotes,
        rating: rating ?? this.rating,
      );
  CoffeeInfoData copyWithCompanion(CoffeeInfoCompanion data) {
    return CoffeeInfoData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      tastingNotes: data.tastingNotes.present
          ? data.tastingNotes.value
          : this.tastingNotes,
      rating: data.rating.present ? data.rating.value : this.rating,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoffeeInfoData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tastingNotes: $tastingNotes, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, tastingNotes, rating);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoffeeInfoData &&
          other.id == this.id &&
          other.name == this.name &&
          other.tastingNotes == this.tastingNotes &&
          other.rating == this.rating);
}

class CoffeeInfoCompanion extends UpdateCompanion<CoffeeInfoData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> tastingNotes;
  final Value<int> rating;
  const CoffeeInfoCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.tastingNotes = const Value.absent(),
    this.rating = const Value.absent(),
  });
  CoffeeInfoCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String tastingNotes,
    required int rating,
  })  : name = Value(name),
        tastingNotes = Value(tastingNotes),
        rating = Value(rating);
  static Insertable<CoffeeInfoData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? tastingNotes,
    Expression<int>? rating,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (tastingNotes != null) 'tasting_notes': tastingNotes,
      if (rating != null) 'rating': rating,
    });
  }

  CoffeeInfoCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? tastingNotes,
      Value<int>? rating}) {
    return CoffeeInfoCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      tastingNotes: tastingNotes ?? this.tastingNotes,
      rating: rating ?? this.rating,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tastingNotes.present) {
      map['tasting_notes'] = Variable<String>(tastingNotes.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoffeeInfoCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tastingNotes: $tastingNotes, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }
}

abstract class _$Db extends GeneratedDatabase {
  _$Db(QueryExecutor e) : super(e);
  $DbManager get managers => $DbManager(this);
  late final $CoffeeInfoTable coffeeInfo = $CoffeeInfoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [coffeeInfo];
}

typedef $$CoffeeInfoTableCreateCompanionBuilder = CoffeeInfoCompanion Function({
  Value<int> id,
  required String name,
  required String tastingNotes,
  required int rating,
});
typedef $$CoffeeInfoTableUpdateCompanionBuilder = CoffeeInfoCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> tastingNotes,
  Value<int> rating,
});

class $$CoffeeInfoTableFilterComposer extends Composer<_$Db, $CoffeeInfoTable> {
  $$CoffeeInfoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tastingNotes => $composableBuilder(
      column: $table.tastingNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));
}

class $$CoffeeInfoTableOrderingComposer
    extends Composer<_$Db, $CoffeeInfoTable> {
  $$CoffeeInfoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tastingNotes => $composableBuilder(
      column: $table.tastingNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));
}

class $$CoffeeInfoTableAnnotationComposer
    extends Composer<_$Db, $CoffeeInfoTable> {
  $$CoffeeInfoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get tastingNotes => $composableBuilder(
      column: $table.tastingNotes, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);
}

class $$CoffeeInfoTableTableManager extends RootTableManager<
    _$Db,
    $CoffeeInfoTable,
    CoffeeInfoData,
    $$CoffeeInfoTableFilterComposer,
    $$CoffeeInfoTableOrderingComposer,
    $$CoffeeInfoTableAnnotationComposer,
    $$CoffeeInfoTableCreateCompanionBuilder,
    $$CoffeeInfoTableUpdateCompanionBuilder,
    (CoffeeInfoData, BaseReferences<_$Db, $CoffeeInfoTable, CoffeeInfoData>),
    CoffeeInfoData,
    PrefetchHooks Function()> {
  $$CoffeeInfoTableTableManager(_$Db db, $CoffeeInfoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoffeeInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoffeeInfoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoffeeInfoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> tastingNotes = const Value.absent(),
            Value<int> rating = const Value.absent(),
          }) =>
              CoffeeInfoCompanion(
            id: id,
            name: name,
            tastingNotes: tastingNotes,
            rating: rating,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String tastingNotes,
            required int rating,
          }) =>
              CoffeeInfoCompanion.insert(
            id: id,
            name: name,
            tastingNotes: tastingNotes,
            rating: rating,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CoffeeInfoTableProcessedTableManager = ProcessedTableManager<
    _$Db,
    $CoffeeInfoTable,
    CoffeeInfoData,
    $$CoffeeInfoTableFilterComposer,
    $$CoffeeInfoTableOrderingComposer,
    $$CoffeeInfoTableAnnotationComposer,
    $$CoffeeInfoTableCreateCompanionBuilder,
    $$CoffeeInfoTableUpdateCompanionBuilder,
    (CoffeeInfoData, BaseReferences<_$Db, $CoffeeInfoTable, CoffeeInfoData>),
    CoffeeInfoData,
    PrefetchHooks Function()>;

class $DbManager {
  final _$Db _db;
  $DbManager(this._db);
  $$CoffeeInfoTableTableManager get coffeeInfo =>
      $$CoffeeInfoTableTableManager(_db, _db.coffeeInfo);
}
