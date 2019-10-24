import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/splash_screen.dart';

//Se quiser, podemos criar rotas para ficar mais fácil de navegar!!
var routes = <String, WidgetBuilder>{
  "/splash": (BuildContext context) => SplashScreenPage(),
  "/home": (BuildContext context) => HomePage(),
};

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 50, 50, 50)),
    ),
      debugShowCheckedModeBanner: false,
      title: "Cartoons adultos",
      home: SplashScreenPage(),
      routes: routes,
    );
  }
}
