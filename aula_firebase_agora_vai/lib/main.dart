import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main(){
  runApp(MaterialApp(
    home: MyApp(),

  ));
//
}

TextEditingController _nomeController = TextEditingController();
TextEditingController _ingredienteController = TextEditingController();
void registra(){
  String nome = _nomeController.text;
  List ingredientes = [];
  ingredientes = _ingredienteController.text.split(",");
  Firestore.instance.collection("receitas").document().setData({"nome":nome,"ingredientes":ingredientes});
}

Future recupera() async {
  Firestore.instance.collection("receitas").snapshots().listen((snapshots){
    for(DocumentSnapshot doc in snapshots.documents){
      print(doc.data);
    };
  });

}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("testando"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              keyboardType:TextInputType.text,
              decoration:InputDecoration(
                labelText:"insira o nome da receita",
                labelStyle:TextStyle(color:Colors.black),
              ),
              style:TextStyle(color:Colors.orange),
            ),

            TextField(
              controller: _ingredienteController,
              keyboardType:TextInputType.text,
              decoration:InputDecoration(
                labelText:"ingredientes da receita",
                labelStyle:TextStyle(color:Colors.black),
              ),
              style:TextStyle(color:Colors.orange),
            ),

            RaisedButton(
              onPressed: registra,
              child: Text('registrar'),
            ),

            RaisedButton(
              onPressed: recupera,
              child: Text('teste'),
            ),


          ],


        ),
      ),
    );

  }
}

