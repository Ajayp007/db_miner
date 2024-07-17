import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? db;

  Future<Database?> checkDB() async {
    if (db != null) {
      return db;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Ajay.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE cate (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,image BLOB)";
        db.execute(query);
        String query2 =
            "CREATE TABLE quotes(id INTEGER PRIMARY KEY AUTOINCREMENT,quotes TEXT,author TEXT,image BLOB)";
        db.execute(query2);
      },
    );
  }

  Future<void> insertCategoryDB(String category, String image) async {
    db = await checkDB();
    File path = File(image);

    Uint8List fileImage = await path.readAsBytes();
    String data = base64Encode(fileImage);
    String query =
        "INSERT INTO cate (category,image) VALUES ('$category','$data')";
    db!.rawInsert(query);
  }

  Future<void> deleteCategoryDB(int index) async {
    db = await checkDB();
    String query = "DELETE FROM cate WHERE id = '$index'";
    db!.rawDelete(query);
  }

  Future<List<Map>> readCategoryDB() async {
    db = await checkDB();
    String query = "SELECT * FROM cate";
    List<Map> l1 = await db!.rawQuery(query);
    return l1;
  }

  Future<void> insertProductDB(String name, String author, String image) async {
    db = await checkDB();
    File path = File(image);

    Uint8List fileImage = await path.readAsBytes();
    String data = base64Encode(fileImage);
    String query =
        "INSERT INTO quotes (quotes,author,image) VALUES ('$name','$author','$data')";
    db!.rawInsert(query);
  }

  Future<void> deleteProductDB(int index) async {
    db = await checkDB();
    String query = "DELETE FROM quotes WHERE id = '$index'";
    db!.rawDelete(query);
  }

  Future<List<Map>> readProductDB() async {
    db = await checkDB();
    String query = "SELECT * FROM quotes";
    List<Map> l1 = await db!.rawQuery(query);
    return l1;
  }
}
