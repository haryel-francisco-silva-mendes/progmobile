import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ItemCard extends StatelessWidget {
  
  final Map<String, dynamic> clicado;
  final int index;
  //final dimDim               = new NumberFormat.simpleCurrency();
  ItemCard(this.clicado, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(89, 89, 89, 1),
      appBar: AppBar(
        title: Text(
          "${clicado['produtos'][index]['nome_item']}",
          style: TextStyle(
            fontFamily: 'faustao',
          ),
        ),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            "${clicado['produtos'][index]['imagem_item']}",
            width: 600.0,
            height: 150,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,2.0,8.0,8.0),
            child: Row(
              children:<Widget>[
                Expanded(
                  child:
                  SizedBox(
                    height:  50.0,
                    child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: int.parse("${clicado['produtos'][index]['pontuacao_item']}"),
                      itemBuilder: (BuildContext ctx, int index){
                        return Icon(Icons.star,
                          color: Colors.yellow[800],
                        );
                      },
                    ),
                  ),
                ),
                
                Expanded(
                  child: 
                  Text('X reviews',textAlign: TextAlign.right,style: TextStyle(fontSize: 14.0),),
                ),
              ],),
          ),
            SizedBox(height: 20.0,),
         
          RichText(
            text: TextSpan(
              text: 'R\$',
              style: TextStyle(color:Colors.red),
              children: <TextSpan>[
                TextSpan(text:"R${clicado['produtos'][index]['preco_item']}", style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
              ],
            ),
          ),




          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${clicado['produtos'][index]['descricao_item']}",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
             
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
