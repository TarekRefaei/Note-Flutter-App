class DBConsts {
  static const String dbName = 'notes.db';
  static const int dbVersion = 1;

  static const String tableName = 'NOTES';
  static const String colId = '_id';
  static const String colNoteId = 'noteId';
  static const String colUserId = 'userId';
  static const String colText = 'text';
  static const String colTime = 'placeDateTime';

  static const String _idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String _textType = 'TEXT NOT NULL';

  static const List<String> columnNames = [
    colId,
    colNoteId,
    colUserId,
    colText,
    colTime,
  ];

  static const String orderByTime = '$colTime ASC';

  static const String createTableCommand = '''
CREATE TABLE $tableName (
  $colId $_idType,
  $colNoteId $_textType,
  $colUserId $_textType,
  $colText $_textType,
  $colTime $_textType
)
''';

  static const String deleteEverythingCommand = 'DELETE FROM $tableName';
}

//
