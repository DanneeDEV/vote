import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'votedb2',
      'votedb2.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<ReadCandidatesRow>> readCandidates() => performReadCandidates(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addCandidate({
    String? candidateName,
    int? candidateVotes,
  }) =>
      performAddCandidate(
        _database,
        candidateName: candidateName,
        candidateVotes: candidateVotes,
      );

  Future deleteCandidate({
    int? id,
  }) =>
      performDeleteCandidate(
        _database,
        id: id,
      );

  Future editCandidate({
    String? candidateName,
    int? id,
  }) =>
      performEditCandidate(
        _database,
        candidateName: candidateName,
        id: id,
      );

  Future plusVote({
    int? candidateVotes,
    int? id,
  }) =>
      performPlusVote(
        _database,
        candidateVotes: candidateVotes,
        id: id,
      );

  Future minusVote({
    int? candidateVotes,
    int? id,
  }) =>
      performMinusVote(
        _database,
        candidateVotes: candidateVotes,
        id: id,
      );

  /// END UPDATE QUERY CALLS
}
