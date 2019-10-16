import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}
  TextEditingController nomeController = TextEditingController();
    TextEditingController precoController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();
    TextEditingController pontuacaoController = TextEditingController();


class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
   
  

    Future adicionar() async {
      var url = "https://patopapao.000webhostapp.com/add-produto.php";
      http.Response response = await http.post(url, body: {
        "nomeProduto": nomeController.text,
        "precoProduto": precoController.text,
        "descricaoProduto": descricaoController.text,
        "pontuacaoProduto": pontuacaoController.text
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('add itens'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                 TextField(
                  keyboardType: TextInputType.number,
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: "nome do item",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.blue),
                ),
                //uma caixa invisivel,
                SizedBox(
                  height: 20.0,
                ),

                TextField(
                  keyboardType: TextInputType.number,
                  controller: precoController,
                  decoration: InputDecoration(
                    labelText: "Preco do item",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(
                  height: 20.0,
                ),

                TextField(
                  keyboardType: TextInputType.text,
                  controller: descricaoController,
                  decoration: InputDecoration(
                    labelText: "Descricao do item",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(
                  height: 20.0,
                ),

                TextField(
                  keyboardType: TextInputType.number,
                  controller: pontuacaoController,
                  decoration: InputDecoration(
                    labelText: "pontuacao do item",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // RaisedButton(
                //   onPressed: () {},
                //   child: Text('    imagem   '),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                // ),
                RaisedButton(
                  onPressed: () {
                    adicionar();
                    Navigator.pop(context);
                  },
                  child: Text('CADASTRAR'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*/ $nomeProduto = $_Post['nomeProduto'];
 $precoProduto =$_Post['precoProduto'];
 $descricaoProduto =$_Post['$descricaoProduto'];
 $pontuacaoProduto =$_Post['$pontuacaoProduto'];
?>*/
