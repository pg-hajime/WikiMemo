import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//TODO ページのimportは１つにまとめたいかも
import 'package:wikimemo/views/list.dart';
import 'package:wikimemo/views/memo.dart';
import 'package:wikimemo/views/edit.dart';
import 'package:wikimemo/main.dart';

//画面遷移用
final GoRouter router = GoRouter(

  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'Home');
      },
      routes:  <RouteBase>[
        GoRoute(
          path: 'lists',
          builder: (BuildContext context, GoRouterState state) {
            return const ListPage();
        }),
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return MemoPage(state.extra! as String);
        }),
        GoRoute(
          path: 'edit',
          builder: (BuildContext context, GoRouterState state) {
            return EditPage();
        }),
      ],
    ),
  ]);