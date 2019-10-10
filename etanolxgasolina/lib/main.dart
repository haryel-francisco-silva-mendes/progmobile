import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController gasolinaController = TextEditingController();
  TextEditingController etanolController = TextEditingController();


  void _compara(){
    double gasolina = double.parse(gasolinaController.text);
    double etanol   = double.parse(etanolController.text);
    double resultado = etanol/gasolina;

    String mensagem = "";

    if(resultado>0.7){
      mensagem = "melhor usar gasolina";
    }else{
      mensagem = "melhor usar álcool";
    }

    showDialog(
      context: context,
      builder: (BuildContext context){
        //retorna objeto tipo dialog
        return AlertDialog(
          title: new Text("Resultado"),
          content : new Text(mensagem),
          actions:<Widget>[
            //define os botoes na base do dialogo
            new FlatButton(
              child:new Text("Fechar"),
              onPressed:(){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Etanol Vs Gasolina",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Open Sans',
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              /*print ajuda a fazer o debug para achar erros na aplicacao*/
              print("to aqui");
              gasolinaController.text = "";
              etanolController.text   = "";
            },
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.airplanemode_active,
                size: 100.0, color: Colors.amberAccent),
                TextField(
                  controller:gasolinaController,
                  keyboardType:TextInputType.number,
                  decoration: InputDecoration(
                    labelText:"Preco da gasolina",
                    labelStyle:TextStyle(color:Colors.black)
                  ),
                  style: TextStyle(color:Colors.orange),
                ),

                TextField(
                  controller:etanolController,
                  keyboardType:TextInputType.number,
                  decoration:InputDecoration(
                    labelText:"Preco do etanol",
                    labelStyle:TextStyle(color:Colors.black),
                  ),
                  style:TextStyle(color:Colors.orange),
                ),
              //uma caixa invisivel, 
              SizedBox(height: 30.0,),

              Container(
                height: 70.0,
  
                child: RaisedButton(
                  child:Text("Comparar",style:TextStyle(color:Colors.white),),
                  onPressed:_compara,
                    color:Colors.green,
                ),
              ),

          ],
        ),
        ),
      ),
    );
  }
}
