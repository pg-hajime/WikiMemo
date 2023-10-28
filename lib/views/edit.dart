import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wikimemo/router.dart';

import 'package:wikimemo/database_helper.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  String _text='';
  String _content_text='';
  final dbHelper = DatabaseHelper.instance;

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }
  void _handleCOntentText(String f) {
    setState(() {
      _content_text = f;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            labelText: 'タイトルを入力してください'
          ),
          onChanged: _handleText,
        )),
      body: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '本文を書いてね',
            ),
            maxLines: null,
           onChanged: _handleCOntentText,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _insert(); // _insertメソッドを実行
          router.go('/details', extra: _text); // ルーティングを実行
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  // 登録ボタンクリック
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : _text,
      DatabaseHelper.columnContent  : _content_text

  };
    final id = await dbHelper.insert(row);
    print('登録しました。id: $id');
  }
}