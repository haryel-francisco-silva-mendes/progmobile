import 'package:flutter/material.dart';
import 'package:teste_giphy/buscar_gifs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste GIPHY',
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.black),
      home: BuscarGifsPage(),
    );
  }
}
