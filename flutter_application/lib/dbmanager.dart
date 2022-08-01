// ignore_for_file: prefer_conditional_assignment

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbStudentManager {
// instance of Database

  Database _database;

// 1. Open Database or Create a New Database
  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), "ss.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE student(id INTEGER PRIMARY KEY autoincrement, name TEXT, course TEXT)",
        );
      });
    }
  }

//2. Insert the Records inside the Database
  Future<int> insertStudent(Student student) async {
    await openDb();
    return await _database.insert('student', student.toMap());
  }

// 3. Display list of Student inside our UI
  Future<List<Student>> getStudentList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('student');
    return List.generate(maps.length, (i) {
      return Student(
          id: maps[i]['id'], name: maps[i]['name'], course: maps[i]['course']);
    });
  }

// 4. Update the Record in the Database
  Future<int> updateStudent(Student student) async {
    await openDb();
    return await _database.update('student', student.toMap(),
        where: "id = ?", whereArgs: [student.id]);
  }

// 5. Delete the Record from the Database
  Future<void> deleteStudent(int id) async {
    await openDb();
    await _database.delete('student', where: "id = ?", whereArgs: [id]);
  }
}

class Student {
  int id;
  String name;
  String course;

// Student constructor
  Student({@required this.name, @required this.course, this.id});

// conversion of data into Object Notation
  Map<String, dynamic> toMap() {
    return {'name': name, 'course': course};
  }
}
