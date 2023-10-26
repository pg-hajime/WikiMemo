import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditPage extends StatelessWidget {
  const EditPage(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)),
      body: Text('本文'),
    );
  }
}