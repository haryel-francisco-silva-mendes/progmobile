import 'package:flutter/material.dart';
import 'package:lista_animada_videos/common/fade_page_route.dart';
import 'package:lista_animada_videos/models/cartoon.dart';

import 'detalhes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cartoon> listaCartoons = [
    Cartoon.preenchido(
        titulo: "Rick and Morty",
        descricao: "Acompanhe malucas viagens no tempo-espaço"
            " e por universos paralelos com Rick,"
            " um cientista com problemas com a bebida, e seu neto Morty,"
            " um adolescente não tão brilhante quanto o avô.",
        imagem: "images/desenhos/rick_and_morty.jpg",
        videoAsset: "videos/rick-morty.mp4"),
    Cartoon.preenchido(
        titulo: "Desencanto",
        descricao: "Toda princesa tem seus deveres, mas ela quer mesmo "
            "é encher a cara. E com um elfo e um demônio como parceiros, "
            "levar o rei à loucura será uma tarefa fácil.",
        imagem: "images/desenhos/desencanto.jpg",
        videoNetwork:
            "https:\/\/r2---sn-aigl6nl7.googlevideo.com\/videoplayback?expire=1571058250&ei=6h2kXY6jM6yHmLAPudaVkAQ&ip=185.27.134.50&id=o-AA42MJMqXA2dTLTP73uzE4m5iZVMNGc5BKajrEeZMFYa&itag=22&source=youtube&requiressl=yes&mm=31%2C26&mn=sn-aigl6nl7%2Csn-5hne6nsk&ms=au%2Conr&mv=u&mvi=1&pl=23&mime=video%2Fmp4&ratebypass=yes&dur=125.550&lmt=1567638523282809&mt=1571036408&fvip=2&fexp=23842630&c=WEB&txp=2316222&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cmime%2Cratebypass%2Cdur%2Clmt&sig=ALgxI2wwRQIgQ6-GWyl3wI-LY5McIiDjTi9_swWzPph80hxU5ID4vTwCIQDL4pzDGdHMUy8PCPiflv2ISys0xtlPREqxCmmHzr0jIQ%3D%3D&lsparams=mm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AHylml4wRAIgO2S59a1iuJHcpLsU4SyUK4HsCy_P4Ix2dNtENZFJO3ICIFuhOOM3XMmlnZ0PmhfCIGUXnwgqlOP381BeS_zxraCx"),
    Cartoon.preenchido(
        titulo: "South Park",
        descricao:
            "Série animada que satiriza com muito humor negro a sociedade"
            " estadounidense ao apresentar situações bizarras e surreais"
            " protagonizadas por Stan, Kyle, Eric e Kenny, as crianças"
            " mais travessas de South Park.",
        imagem: "images/desenhos/south_park.jpg"),
    Cartoon.preenchido(
        titulo: "Big Mouth",
        descricao: "Big Mouth é uma série animada de comédia adulta criada"
            " por Nick Kroll, Andrew Goldberg, Mark Levin e Jennifer Flackett,"
            " e exibida pela Netflix desde setembro de 2017. Com a narrativa baseada"
            " na vida de Kroll e Goldberg no período de pré-adolescência,"
            " a sitcom aborda temas como puberdade e sexo",
        imagem: "images/desenhos/big_mouth.jpg"),
    Cartoon.preenchido(
        titulo: "Family Guy",
        descricao:
            "O desenho animado mostra o conturbado cotidiano dos Griffins."
            " Peter e Lois são pais da mimada adolescente Meg; do preguiçoso"
            " Chris, de 13 anos e do caçula Stewie, uma criança diabólica."
            " Eles ainda têm o falante cão Brian, o mais inteligente do grupo.",
        imagem: "images/desenhos/family_guy.jpg"),
  ];

  ListTile criarTile(IconData icone, String texto) {
    return ListTile(
      leading: Icon(icone, color: Colors.white),
      title: Text(
        texto,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      onTap: () {
        /*Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        //Esse null tem que ser substituído pela página que queremos
                        builder: (BuildContext context) => null),
                  );*/
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 30, 45, 62),
          child: Column(
            children: <Widget>[
              //AppBar(automaticallyImplyLeading: false, title: Text("Escolha:")),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 150.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              criarTile(Icons.list, "Listagem"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        //Text() cria um texto na tela, só. É uma label.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.brush),
            SizedBox(width: 5.0),
            Text(
              'Cartoons Adultos',
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 8, 26, 46),
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          FadePageRoute(
                              widget: DetalhesPage(listaCartoons[index])));
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      leading: Container(
                        
                        child: Hero(
                          tag: listaCartoons[index].titulo,
                          child: Image.asset(
                            listaCartoons[index].imagem,
                            width: 100,
                            height: 250,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      //Image(image: new AssetImage(produtos[index]['imagem']),width: 100,),
                      title: Text(
                        listaCartoons[index].titulo,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 22.0),
                      ),
                      subtitle: Text(
                        listaCartoons[index].descricao,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 2.0,
                  ),
                ],
              );
            },
            itemCount: listaCartoons.length),
      ),
    );
  }
}
