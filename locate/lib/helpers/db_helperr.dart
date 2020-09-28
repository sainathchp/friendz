import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
class DBHelper{
  static Future<void> insert(String table,Map<String,Object>data) async{
   final db= await DBHelper.database();
   db.insert(table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
   print("insert");
}
   static Future<Database> database() async{
     final dbpath= await sql.getDatabasesPath();
     return sql.openDatabase(path.join(dbpath,'places.db'),onCreate: (db,version) {
       return db.execute("CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT,loc_lat REAL,loc_log REAL,address TEXT)");
     },version: 1);
   }
   static Future<List<Map<String,dynamic>>> getData(String table) async{
    final db=await DBHelper.database();
    return db.query(table);
   }
}