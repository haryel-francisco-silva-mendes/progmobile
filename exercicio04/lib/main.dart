import 'package:flutter/material.dart';

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
  TextEditingController _textFieldController = TextEditingController();
  String _textoNaTela = "";

  void _capturaTexto() {
    setState(() {
        //acao do botao
        _textoNaTela = _textFieldController.text.toString();
        showDialog(
          context: context,
          builder:(BuildContext context){
            return AlertDialog(
              title: new Text(_textoNaTela),
              actions:<Widget>[
                new FlatButton(
                  child: new Text("fechar"),
                  onPressed:(){
                    Navigator.of(context).pop();
                  },
                ),
              ]
            );
          },
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:25.0),
          child: TextField(
            controller: _textFieldController,
            decoration:InputDecoration(
              hintText:"informe seu nome de usuario",
              icon:Icon(Icons.person),
              
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _capturaTexto,
        tooltip: 'captura valor do campo de texto',
        child: Icon(Icons.account_box),
      ),
      
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
