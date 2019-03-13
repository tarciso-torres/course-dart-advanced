import 'package:flutter/material.dart';
import './articles_pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Meus artigos'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Avançar'),
          onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticlePage())
            );
          },
        ),
      ),
    );
  }
}