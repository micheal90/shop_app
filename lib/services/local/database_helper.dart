import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database _database;
  static init() async {
    _database = await openDatabase(
      'products.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE products(id TEXT,title TEXT,price TEXT,description TEXT,imageUrl TEXT,isFavorite TEXT)');
        print('database created');
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    return _database.rawQuery('SELECT * FROM products');
  }

  static insertProduct({
    required String id,
    required String title,
    required String price,
    required String description,
    required String imageUrl,
    String isFavorite = 'false',
  }) async {
    await _database.rawInsert(
        'INSERT INTO products(id, title,price,description,imageUrl,isFavorite) VALUES("$id" , "$title","$price","$description","$imageUrl","$isFavorite")');
  }

  static updateProduct({
    required String id,
    required String title,
    required String price,
    required String description,
    required String imageUrl,
  }) async {
    await _database.rawUpdate(
        'UPDATE products SET title = ?, price = ?,description = ?,imageUrl= ? WHERE id = ?',
        [title, price, description, imageUrl, id]);
  }

  static changeIsFavorite(
      {required String id, required String isFavorite}) async {
    print(isFavorite);
    await _database.rawUpdate(
        'UPDATE products SET isFavorite = ? WHERE id = ?', [isFavorite, id]);
  }

  static deleteProduct(String id) async {
    await _database.rawDelete('DELETE FROM products WHERE id = "$id"');
  }
}
