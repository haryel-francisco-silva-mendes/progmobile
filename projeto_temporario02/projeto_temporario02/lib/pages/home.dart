import 'package:flutter/material.dart';
import 'package:projeto_temporario02/models/cartoon.dart';
import 'package:projeto_temporario02/pages/detalhes.dart';

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
        imagem: "images/desenhos/desencanto.jpg"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.brush),
            SizedBox(width: 5.0),
            Text('cartoons Adultos'),
          ],
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 8, 26, 46),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DetalhesPage(listaCartoons[index]),
                      ),
                    );
                  },
                  contentPadding: EdgeInsets.all(15),
                  leading: Hero(
                    tag: listaCartoons[index].titulo,
                                      child: Image.asset(
                      listaCartoons[index].imagem,
                      width: 100,
                      height: 250,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  title: Text(
                    listaCartoons[index].titulo,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 22.0,
                    ),
                  ),
                  subtitle: Text(
                    listaCartoons[index].descricao,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 22.0,
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
          itemCount: listaCartoons.length,
        ),
      ),
    );
  }
}
