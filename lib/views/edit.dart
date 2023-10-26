import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wikimemo/router.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  String _text='';

  void _handleText(String e) {
    setState(() {
      _text = e;
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
      body: Text('本文'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => router.go('/details', extra: _text),
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}