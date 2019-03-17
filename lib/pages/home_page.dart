import 'package:flutter/material.dart';
import '../data/save_local.dart';
import './articles_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final feedController = TextEditingController();

  List feeds = [];
  @override
  Widget build(BuildContext context) {
  SaveLocal persistence = new SaveLocal(feedList: feeds);
  setState(() {
    persistence.read().then((data){
      feeds = data;
    });
  });


    return Scaffold(
      appBar:AppBar(
        title: Text('Meus feeds'),
        automaticallyImplyLeading: false,
      ),
      body:Padding(
        padding: EdgeInsets.all(20),
        child:  Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: feeds.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(feeds[index]),
                    leading: Icon(Icons.rss_feed),
                    onTap: () {
                      print(index.toString());
                    },
                  );
                },
              )
            ),
            TextFormField(
              keyboardType:TextInputType.url,
              controller: feedController,
              decoration: InputDecoration(
                labelText: 'Link do rss',
              ),
              validator: (value) {
                if(value.isEmpty){
                  return "Este campo não pode ficar em branco";
                }
              },
            ),
            RaisedButton(
              child: Text('Cadastrar'),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                if(_formKey.currentState.validate()){
                  setState(() {
                    feeds.add(feedController.text);
                    feedController.text = '';

                    persistence.save(feeds);
                  });
                }
              },
            )
          ]
        ),
      ),
      )
    );
  }
}