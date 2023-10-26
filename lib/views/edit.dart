import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('編集画面')),
      body: Text('本文'),
    );
  }
}