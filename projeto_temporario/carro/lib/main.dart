import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'model/carro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Carro com imagem",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: AppCarro(),
    );
  }
}

class AppCarro extends StatefulWidget {
  @override
  _AppCarroState createState() => _AppCarroState();
}

class _AppCarroState extends State<AppCarro> {
  TextEditingController tecMarca = TextEditingController();
  TextEditingController tecModelo = TextEditingController();
  TextEditingController tecCor = TextEditingController();
  TextEditingController tecPotencia = TextEditingController();

  Carro carro = new Carro();
  String exibeCarro = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carro com foto"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: tecMarca,
            decoration: InputDecoration(
              hintText: "digite a marca ",
            ),
          ),
          SizedBox(height: 25.0),
          TextField(
            controller: tecModelo,
            decoration: InputDecoration(
              hintText: "digite a modelo ",
            ),
          ),
          SizedBox(height: 25.0),
          TextField(
            controller: tecCor,
            decoration: InputDecoration(
              hintText: "digite a cor ",
            ),
          ),
          SizedBox(height: 25.0),
          TextField(
            controller: tecPotencia,
            decoration: InputDecoration(
              hintText: "digite a potencia ",
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: OutlineButton(
              onPressed: () {
                abrirImagePicker(context);
              },
              borderSide: BorderSide(
                color: Colors.teal,
                width: 3.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.camera_alt),
                  SizedBox(width: 10.0),
                  Text("escolha uma imagem"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: RaisedButton(
              onPressed: () {
                carro.marca = tecMarca.text;
                carro.modelo = tecModelo.text;
                carro.cor = tecCor.text;
                carro.potencia = double.parse(tecPotencia.text);

                setState(() {
                  exibeCarro = carro.toString();
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.fiber_new),
                  SizedBox(width: 10.0),
                  Text("criar"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Center(child: Text(exibeCarro)),
          carro.imagem == null?
          Text(""):
          Image.file(
            carro.imagem,
          ),
        ],
      ),
    );
  }

  void abrirImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.0,
          color: Colors.teal[200],
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text("escolha uma imagem"),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: () {
                  pegarImagem(context, ImageSource.camera);
                },
                child: Text("usar a camera"),
              ),
              FlatButton(
                onPressed: () {
                  pegarImagem(context, ImageSource.gallery);
                },
                child: Text("usar a galeria"),
              ),
            ],
          ),
        );
      },
    );
  }

  void pegarImagem(BuildContext context, ImageSource src) {
    ImagePicker.pickImage(source: src,maxWidth: 380.0).then(
      (File img){
        carro.imagem = img; 
        Navigator.pop(context);
      }
    );
  }
}
