
import 'dart:io';

class Carro{
  String marca;
  String modelo;
  String cor;
  double potencia;
  File imagem;

  Carro();
  @override
  String toString(){
    return "Carro criado\n"
    "A marca é: ${marca}\n"
    "O modelo é: ${modelo}\n"
    "A cor é: ${cor}\n"
    "A potencia é: ${potencia}\n";
  }
}

