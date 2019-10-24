import 'package:flutter/material.dart';
import 'package:lista_animada_videos/common/chewie_list_item.dart';
import 'package:lista_animada_videos/models/cartoon.dart';
import 'package:video_player/video_player.dart';

class DetalhesPage extends StatefulWidget {
  Cartoon _cartoon;

  DetalhesPage(this._cartoon);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    /*Isso aqui é caso dê algum problema kkk*/
    //WillPopScope(
    /*onWillPop: () {
      print("Botão voltar pressionado.");
      //Aqui é a navegação voltando
      Navigator.pop(context, false);

      if (cli.videoPlayerController != null){
        cli.videoPlayerController.dispose();
      }

      //Aqui é pra usar lá no método then() sem dar bug
      //DETALHE: não pode ser true aqui no Future, por que se não da crash
      //Ele vai tentar fazer o pop duas vezes e não vai conseguir, manja?
      return Future.value(false);
    },
    child:*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes ${widget._cartoon.titulo}"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Hero(
                tag: widget._cartoon.titulo,
                child: Center(
                  child: Image.asset(
                    widget._cartoon.imagem,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              checkVideo(widget._cartoon)
                  ? ChewieListItem(
                      videoPlayerController: widget._cartoon.videoAsset == null
                          ? VideoPlayerController.network(
                              widget._cartoon.videoNetwork,
                            )
                          : VideoPlayerController.asset(
                              widget._cartoon.videoAsset,
                            ),
                      looping: false,
                    )
                  : Container()

              /*Colocar esse cara em Cupertino*/
              /*Theme(
                  data: ThemeData.light().copyWith(platform: TargetPlatform.iOS),
                  child: )*/
            ],
          ),
        ],
      ),
    );
  }

  bool checkVideo(Cartoon verificar) {
    if (verificar.videoAsset == null && verificar.videoNetwork == null) {
      return false;
    } else {
      return true;
    }
  }
}
