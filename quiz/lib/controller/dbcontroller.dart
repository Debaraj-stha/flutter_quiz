import 'package:quiz/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class dbController {
  static Database? database;
  Future<Database?> get db async {
    if (database != null) {
      return database;
    } else {
      database = await initializeDatabase();
    }
  }

  Future<Database?> initializeDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.toString(), "db.dart");
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String sql =
            "create table history_details(id TEXT PRIMARY KEY,question TEXT,correctAnswer TEXT,givenAnswer TEXT,historyId TEXT)";
        db.execute(sql);
        String sql1 =
            "create table history(id  TEXT PRIMARY KEY,score INTEGER,playedAt TEXT)";
        db.execute(sql);
      },
    );
    return db;
  }

  Future<history> insertHistory(history h) async {
    var dbClient = await db;
    await dbClient!.insert("history", h.toJson());
    return h;
  }

  Future<bool> deleteHistory(int id) async {
    var dbClient = await db;
    await dbClient!.delete("history", where: "id=?", whereArgs: [id]);
    return true;
  }

  Future<history> updateHistory(history h, int id) async {
    var dbClient = await db;
    await dbClient!
        .update("history", h.toJson(), where: "id=?", whereArgs: [id]);
    return h;
  }

  Future<List<history>> getHistory() async {
    var dbClient = await db;
    if (dbClient == null) {
      return [];
    }
    final List<Map<String, Object?>> result = await dbClient.query(
      "history",
    );
    return result.map((e) => history.fromJson(e)).toList();
  }

  Future<history_details> insertDetails(history_details h) async {
    var dbClient = await db;
    await dbClient!.insert("history_details", h.toJson());
    return h;
  }

  Future<bool> deleteDetails(int id) async {
    var dbClient = await db;
    await dbClient!.delete("history_details", where: "id=?", whereArgs: [id]);
    return true;
  }

  Future<List<history_details>> getHistoryDetails() async {
    var dbClient = await db;
    if (dbClient == null) {
      return [];
    }
    final List<Map<String, Object?>> result =
        await dbClient.query("history_details");
    return result.map((e) => history_details.fromJson(e)).toList();
  }
}
