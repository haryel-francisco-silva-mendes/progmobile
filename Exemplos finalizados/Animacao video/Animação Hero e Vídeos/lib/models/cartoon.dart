import 'package:flutter/material.dart';

class Cartoon {
  String titulo;
  String descricao;
  String imagem;
  String videoAsset;
  String videoNetwork;

  Cartoon.preenchido({@required this.titulo, @required this.descricao, @required this.imagem,
      this.videoAsset, this.videoNetwork});
}