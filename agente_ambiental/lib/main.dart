import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String teste = "";
  //CLASSES*************************************************************

  void _teste() {
    print(teste);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200.0,
                child: Image.asset('assets/image/logo.png'),
              ),
              TextField(
                // controller:    ,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Informe seu email",
                  labelStyle: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                // controller:    ,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Informe sua senha",
                  labelStyle: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: RaisedButton(
                  child: Text(
                    "Acessar Minha Conta",
                    style: TextStyle(color: Colors.orangeAccent),
                  ),
                  onPressed: _teste,
                  color: Colors.black,
                ),
                height: 50.00,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue[400]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                  '____________________________________________________________'),
              SizedBox(height: 20),
             
             Container(
                child: RaisedButton(
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                       Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                      Text(
                        '                       Login com facebook',
                        style: TextStyle(color: Colors.white),
                      ),
                     
                    ],
                  ),
                  onPressed: (){} 
                ),
              ),

              SizedBox(height: 20),
              Container(
                child: RaisedButton(
                  color: Color(0XFFFF0000),
                  child: Row(
                    children: <Widget>[
                       Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      Text(
                        '                          Loguin com Google',
                        style: TextStyle(color: Colors.white),
                      ),
                     
                    ],
                  ),
                  onPressed: (){} 
                ),
              ),
              SizedBox(height:20.00),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cadastrar',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue[400]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
