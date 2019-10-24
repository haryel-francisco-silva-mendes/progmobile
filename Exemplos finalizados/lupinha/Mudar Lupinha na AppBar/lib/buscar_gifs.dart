import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detalhes_gif.dart';

class BuscarGifsPage extends StatefulWidget {
  @override
  _BuscarGifsPageState createState() => _BuscarGifsPageState();
}

class _BuscarGifsPageState extends State<BuscarGifsPage> {
  Widget _tituloAppBar = Text("Buscar GIF");
  Icon _iconeBusca = Icon(Icons.search);
  Map<String, dynamic> gifs;
  TextEditingController tecBusca = TextEditingController();

  void pesquisarGif() {
    setState(() {
      if (_iconeBusca.icon == Icons.search) {
        _iconeBusca = Icon(Icons.close);
        _tituloAppBar = TextField(
          controller: tecBusca,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: "Digitar a busca...",
            hintStyle: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
            suffix: IconButton(
              color: Colors.white,
              icon: Icon(Icons.check),
              onPressed: () async {
                var retorno = await buscarAPIGiphy(busca: tecBusca.text);
                setState(() {
                  gifs = retorno;
                  tecBusca.text = "";
                  _iconeBusca = Icon(Icons.search);
                  _tituloAppBar = Text("Buscar GIF");
                });
              },
            ),
          ),
        );
      } else {
        _iconeBusca = Icon(Icons.search);
        _tituloAppBar = Text("Buscar GIF");
      }
    });
  }

  Future<Map<String, dynamic>> buscarAPIGiphy({String busca}) async {
    print("Entrou no método buscarAPIGiphy!");

    Uri uri;

    if (busca == null) {
      uri = Uri.https("api.giphy.com", "/v1/gifs/trending",
          {'api_key': 'JCdAKj2dvCxz3GjNPuprLPjyyN1q32tz', 'lang': 'pt'});
    } else {
      //1º) escreve o link para usar a API
      uri = Uri.https("api.giphy.com", "/v1/gifs/search", {
        'q': busca,
        'api_key': 'JCdAKj2dvCxz3GjNPuprLPjyyN1q32tz',
        'lang': 'pt'
      });
    }

    print(uri);
    //2º) Fazer a requisição na web (ou seja, GET)
    http.Response resposta = await http.get(uri);

    //3º) Decodificar o objeto resposta em um json.
    Map<String, dynamic> respostaDecodificada = json.decode(resposta.body);

    print(respostaDecodificada);

    return respostaDecodificada;
  }

  @override
  void initState() {
    buscarAPIGiphy().then((mapa) {
      setState(() {
        gifs = mapa;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Buscador de GIFs",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: _tituloAppBar,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: _iconeBusca,
              onPressed: pesquisarGif,
            ),
          ],
        ),
        body: Container(
          color: Colors.black,
          //height: MediaQuery.of(context).size.height,
          child: gifs == null || gifs["data"].length == 0
              ? Center(
                  child: Text(
                    "Nenhum GIF encontrado!\n\n"
                    "Por favor, realize uma pesquisa!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : GridView.builder(
                  itemCount: gifs["data"].length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onTap: () {
                        String img =
                            gifs["data"][i]["images"]["original"]["url"];
                        String titulo = gifs["data"][i]["title"];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => DetalhesGifPage(
                              titulo,
                              img,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.black,
                        child: Column(
                          children: <Widget>[
                            FadeInImage(
                              height: 150.0,
                              placeholder: AssetImage("images/loading.gif"),
                              image: NetworkImage(
                                  gifs["data"][i]["images"]["original"]["url"]),
                            ),
                            Text(
                              gifs["data"][i]["title"],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
