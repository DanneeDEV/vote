import 'package:sqflite/sqflite.dart';

/// BEGIN ADD CANDIDATE
Future performAddCandidate(
  Database database, {
  String? candidateName,
  int? candidateVotes,
}) {
  final query = '''
INSERT into candidates (candidateName, candidateVotes) VALUES ('${candidateName}', ${candidateVotes}) 
''';
  return database.rawQuery(query);
}

/// END ADD CANDIDATE

/// BEGIN DELETE CANDIDATE
Future performDeleteCandidate(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM candidates WHERE id = ${id};
''';
  return database.rawQuery(query);
}

/// END DELETE CANDIDATE

/// BEGIN EDIT CANDIDATE
Future performEditCandidate(
  Database database, {
  String? candidateName,
  int? id,
}) {
  final query = '''
UPDATE candidates
SET 
    candidateName = '${candidateName}'
WHERE ID = ${id};
''';
  return database.rawQuery(query);
}

/// END EDIT CANDIDATE

/// BEGIN PLUS VOTE
Future performPlusVote(
  Database database, {
  int? candidateVotes,
  int? id,
}) {
  final query = '''
UPDATE candidates SET candidateVotes = candidateVotes + 1 WHERE id = ${id};

''';
  return database.rawQuery(query);
}

/// END PLUS VOTE

/// BEGIN MINUS VOTE
Future performMinusVote(
  Database database, {
  int? candidateVotes,
  int? id,
}) {
  final query = '''
UPDATE candidates SET candidateVotes = candidateVotes - 1 WHERE id = ${id};

''';
  return database.rawQuery(query);
}

/// END MINUS VOTE
