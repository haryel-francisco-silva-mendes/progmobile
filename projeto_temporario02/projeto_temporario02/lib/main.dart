import 'package:flutter/material.dart';
import 'pages/home.dart';
void main() => runApp(MyApp());
//sempre que usa o / que seria a default 'home' , nao pode ser instanciada a home em baixo para evitar um 
//erro de redundancia
var rotas = <String, WidgetBuilder>{
  "/": (BuildContext context)=> HomePage(),
};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartons adultos',
      theme: ThemeData(
        
        appBarTheme: AppBarTheme(color: Color.fromARGB(255,50,50,50)),
      ),
      debugShowCheckedModeBanner: false,
      routes: rotas,
    );
  }
}

