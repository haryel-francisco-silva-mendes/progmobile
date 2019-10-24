import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main(){
  Firestore.instance.collection("receitas").document().setData({"nome":"pao com manteiga","ingredientes":["manteiga", "pao"]});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
