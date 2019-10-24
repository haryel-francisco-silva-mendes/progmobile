import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      return Navigator.pushNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Widget usado para EMPILHAR outros widgets
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              //Criar uma cor sólida
              color: Color.fromARGB(255, 49, 96, 173),
              //Criar uma cor gradiente
              //Esse cara, obviamente, precisa de uma lista de cores
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 26, 120, 219),
                  Color.fromARGB(255, 1, 9, 10)
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Esse cara cria uma imagem de maneira circular
              /*CircleAvatar(
                backgroundColor: Colors.white,
                radius: 125,
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.scaleDown,
                  height: 200,
                  width: 200,
                ),
              ),*/
              Padding(
                padding: EdgeInsets.only(
                  left: 60,
                  right: 60,
                ),
                child: Image.asset(
                  "images/adult.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Cartoons Adultos",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26.0
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
