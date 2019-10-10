import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
 //import 'package:intl/intl.dart';
import 'item-produto.dart';
import 'package:http/http.dart' as http; 

class Produto extends StatefulWidget {
  @override
  _ProdutoState createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
// final dimDim               = new NumberFormat.simpleCurrency();
  Map<String, dynamic> dados;
  
  Future<String> getData() async{
    var response = await http.get(
      Uri.encodeFull("https://patopapao.000webhostapp.com/lista_de_item.php"),
      headers:{'Accept':'Application/json'},
    );
    //setstate atualiza a tela
    this.setState(() {
      dados = json.decode(response.body);
      print(dados);
    });

    return "teste";
  }

  
  @override
  Widget build(BuildContext context) {
    // dados = {
    //   'produto': [
    //     {'id_produto': ,'nome': '','preco': ,'descricao': '','pontuacao': ,'imagem':''},/*link e nome*/
    //     {'id_produto': ,'nome': '','preco': ,'descricao': '','pontuacao': ,'imagem':''},/*link e nome*/
    //             {'id_produto': ,'nome': '','preco': ,'descricao': '','pontuacao': ,'imagem':''},/*link e nome*/
    //   ],
    // };
    return Scaffold(
      backgroundColor: Color.fromRGBO(89, 89, 89, 1),
      appBar: AppBar(
        title: Text("lista de produtos "),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
        child: ListView.builder(
          itemCount: dados == null ? 0 : dados['produtos'].length,
          itemBuilder:(BuildContext context, int index){
            print(dados['produtos'].length);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ItemCard(dados, index),
                ));
              },
              
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //expanded pode ser usado para evitar que a imagem estoure para fora da tela, é bastante usado quando tem bastante conteudos que podem bugar a tela
                    //expanded tem que ser usado em textos para evitar que ele estoure para fora
                    SizedBox(
                      width: 200.0,
                      height: 130.0,
                      child:
                    CachedNetworkImage(
                        imageUrl: "${dados['produtos'][index]['imagem_item']}",
                        placeholder: (context, url) => new CircularProgressIndicator(),
                        errorWidget: (context, url, error) => new Icon(Icons.error),
                        
                    ),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${dados['produtos'][index]['nome_item']}",
                              style: TextStyle(
                                color: Color.fromRGBO(250, 0, 0, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${dados['produtos'][index]['descricao_item']}",
                            ),
                            Text(
                              "${dados['produtos'][index]['preco_item']}",
                              style: TextStyle(
                                fontFamily: 'faustao',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  @override
   void initState(){
    super.initState();
     this.getData(); 
   }
}

//********************************************************************************************************************************************************* */

