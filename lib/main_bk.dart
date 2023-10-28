import 'package:flutter/material.dart';
import 'package:wikimemo/router.dart';
import 'package:wikimemo/views/list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wikimemo/database_helper.dart';
import 'package:path_provider/path_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router, //routerの宣言
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final dbHelper = DatabaseHelper.instance;
  @override
  _MyHomePageState createState() => _MyHomePageState();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLiteデモ'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: _insert,
            child: const Text('登録', style: TextStyle(fontSize: 35),),
          ),
          ElevatedButton(
            onPressed: _query,
            child: const Text('照会', style: TextStyle(fontSize: 35),),
          ),
          ElevatedButton(
            onPressed: _update,
            child: const Text('更新', style: TextStyle(fontSize: 35),),
          ),
          ElevatedButton(
            onPressed: _delete,
            child: const Text('削除', style: TextStyle(fontSize: 35),),
          ),
        ],
      ),
    );
  }

  // 登録ボタンクリック
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : '山田　太郎',
      DatabaseHelper.columnAge  : 35
    };
    final id = await dbHelper.insert(row);
    print('登録しました。id: $id');
  }

  // 照会ボタンクリック
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('全てのデータを照会しました。');
    allRows.forEach(print);
  }

  // 更新ボタンクリック
  void _update() async {
     Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : '鈴木　一郎',
      DatabaseHelper.columnAge  : 48
    };
    final rowsAffected = await dbHelper.update(row);
    print('更新しました。 ID：$rowsAffected ');
  }

  // 削除ボタンクリック
  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('削除しました。 $rowsDeleted ID: $id');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 登録ボタン
          ElevatedButton(
            onPressed: _insert,
            child: const Text('登録', style: TextStyle(fontSize: 35),),
          ),
          // 照会ボタン
          ElevatedButton(
            onPressed: _query,
            child: const Text('照会', style: TextStyle(fontSize: 35),),
          ),
          // 更新ボタン
          ElevatedButton(
            onPressed: _update,
            child: const Text('更新', style: TextStyle(fontSize: 35),),
          ),
          // 削除ボタン
          ElevatedButton(
            onPressed: _delete,
            child: const Text('削除', style: TextStyle(fontSize: 35),),
          ),
        ],
      ),
    );
  }
  // 登録ボタンクリック
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : '山田　太郎',
      DatabaseHelper.columnAge  : 35
    };
    final id = await dbHelper.insert(row);
    print('登録しました。id: $id');
  }

  // 照会ボタンクリック
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('全てのデータを照会しました。');
    allRows.forEach(print);
  }

  // 更新ボタンクリック
  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : '鈴木　一郎',
      DatabaseHelper.columnAge  : 48
    };
    final rowsAffected = await dbHelper.update(row);
    print('更新しました。 ID：$rowsAffected ');
  }

  // 削除ボタンクリック
  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('削除しました。 $rowsDeleted ID: $id');
  }
}
