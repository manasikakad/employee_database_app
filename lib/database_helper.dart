// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   late Database _database;

//   Future<void> initializeDatabase() async {
//     if (_database != null) return;

//     _database = await openDatabase(
//       join(await getDatabasesPath(), 'employee_database.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE employees(id INTEGER PRIMARY KEY, name TEXT, position TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<void> insertEmployee(Employee employee) async {
//     await _database.insert(
//       'employees',
//       employee.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Employee>> getEmployees() async {
//     final List<Map<String, dynamic>> maps = await _database.query('employees');
//     return List.generate(maps.length, (i) {
//       return Employee(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         position: maps[i]['position'],
//       );
//     });
//   }

//   // Add methods for updating, deleting, and refreshing data
// }
