

import 'package:flutter/material.dart';
import 'package:wikimemo/router.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  static const moviesTitles = ['Inception', 'Heat', 'Spider Man'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト表示'),
      ),
      body: ListView(
        children: moviesTitles.map((title) =>
          GestureDetector(
            onTap: () => router.go('/details', extra: title),
            child:Card(
              child: ListTile(
                title: Text(title),
              ),
            ),
          ),
        ).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),),
    );
  }
}