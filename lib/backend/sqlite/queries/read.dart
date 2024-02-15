import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN READ CANDIDATES
Future<List<ReadCandidatesRow>> performReadCandidates(
  Database database,
) {
  final query = '''
SELECT * FROM candidates ORDER BY candidateVotes DESC;

''';
  return _readQuery(database, query, (d) => ReadCandidatesRow(d));
}

class ReadCandidatesRow extends SqliteRow {
  ReadCandidatesRow(Map<String, dynamic> data) : super(data);

  String get candidateName => data['candidateName'] as String;
  int get candidateVotes => data['candidateVotes'] as int;
  int get id => data['id'] as int;
}

/// END READ CANDIDATES
