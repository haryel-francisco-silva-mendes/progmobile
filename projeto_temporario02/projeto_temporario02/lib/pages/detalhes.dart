import 'package:flutter/material.dart';
import 'package:projeto_temporario02/common/chewie_list_item.dart';
import 'package:projeto_temporario02/models/cartoon.dart';
import 'package:video_player/video_player.dart';
class DetalhesPage extends StatefulWidget {
  final Cartoon cartoon;
  DetalhesPage(this.cartoon);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes ${widget.cartoon.titulo}"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: Hero(
                    tag: widget.cartoon.titulo,
                    child: Image.asset(
                      widget.cartoon.imagem,
                      width: 300,
                      fit: BoxFit.cover,
                    )),   
              ),
              ChewieListItem(
                  looping: false,
                  videoPlayerController: VideoPlayerController.asset(
                    widget.cartoon.videoAsset, 
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
