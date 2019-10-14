import 'package:flutter/material.dart';

class Cartoon {
  String titulo;
  String descricao;
  String imagem;
  String videoNetwork;
  String videoAsset;

  Cartoon();

  Cartoon.preenchido({
    @required this.titulo,
    @required this.descricao,
    @required this.imagem,
    this.videoNetwork,
    this.videoAsset,
  });
}
