import 'package:flutter/material.dart';

class DetalhesGifPage extends StatefulWidget {
  final String _titulo;
  final String _imagem;

  DetalhesGifPage(this._titulo, this._imagem);

  @override
  _DetalhesGifPageState createState() => _DetalhesGifPageState();
}

class _DetalhesGifPageState extends State<DetalhesGifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._titulo),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.network(widget._imagem),
                ),
                SizedBox(
                  height: 25.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Voltar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
