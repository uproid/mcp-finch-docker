import 'package:app/app.dart';
import 'package:finch/finch_sqlite.dart';
import 'package:sqlite3/src/ffi/api.dart';

class TodosDB extends SqliteTable {
  @override
  String get tableName => 'todos';

  @override
  DatabaseDriver<Database> get db => app.sqliteDriver;
  TodosDB() : super();

  @override
  MTable get table => MTable(name: this.tableName, fields: [
        MFieldInt(
          name: 'id',
          isPrimaryKey: true,
          isAutoIncrement: true,
          isNullable: false,
        ),
        MFieldVarchar(name: 'title', length: 100),
        MFieldVarchar(name: 'description', length: 255),
        MFieldBoolean(name: 'is_completed'),
        MFieldDateTime(name: 'created_at'),
        MFieldDateTime(name: 'updated_at', defaultValue: "CURRENT_TIMESTAMP"),
      ]);

  @override
  Future<({int count, SqlDatabaseResult<dynamic, dynamic, dynamic> rows})>
      findAll({
    String orderBy = 'id',
    bool orderReverse = true,
    Map<String, dynamic> filters = const {},
    int? pageSize,
    int? offset,
  }) async {
    var query = Sqler()
      ..selects(table.allSelectFields())
      ..from(this.qName);
    query = updateFilters(query, filters);
    var res = await db.execute(query);
    return (count: res.countRecords, rows: res);
  }

  @override
  Sqler updateFilters(Sqler query, Map<String, dynamic> filter) {
    return query;
  }

  Future<SqlDatabaseResult> insert(Map<String, dynamic> data) async {
    var query = Sqler().insert(qName, [
      {
        'title': QVar(data['title'] ?? ''),
        'description': QVar(data['description'] ?? ''),
        'is_completed': QVar(data['is_completed'] ?? false),
        'created_at': QVar(DateTime.now().toIso8601String()),
        'updated_at': QVar(DateTime.now().toIso8601String()),
      }
    ]);
    return db.execute(query);
  }

  Future<SqlDatabaseResult> update(int id, Map<String, String?> map) async {
    var query = Sqler()
      ..update(qName)
      ..updateSet('title', QVar(map['title'] ?? ''))
      ..updateSet('description', QVar(map['description'] ?? ''))
      ..updateSet('updated_at', QVar(DateTime.now().toIso8601String()))
      ..whereOne(QField('id'), QO.EQ, QVar(id));

    return db.execute(query);
  }

  Future<SqlDatabaseResult> delete(int id) async {
    var query = Sqler()
      ..delete()
      ..from(qName)
      ..whereOne(QField('id'), QO.EQ, QVar(id));

    return db.execute(query);
  }
}
