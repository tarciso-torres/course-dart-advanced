import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/articles_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feeds Reader',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/article': (context) => ArticlePage(),
      },
    );
  }
}


