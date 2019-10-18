import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

TextEditingController nomeController = TextEditingController();
TextEditingController precoController = TextEditingController();
TextEditingController descricaoController = TextEditingController();
TextEditingController pontuacaoController = TextEditingController();

File imgFile;

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    Future adicionar() async {
      var url = "http://haryel.tecnicosenac.tk/add-produto.php";
      http.Response response = await http.post(url, body: {
        "nomeProduto": nomeController.text,
        "precoProduto": precoController.text,
        "descricaoProduto": descricaoController.text,
        "pontuacaoProduto": pontuacaoController.text
      });
    }

    Future getImageCamera() async {
      imgFile = await ImagePicker.pickImage(source: ImageSource.camera);
      if (imgFile == null) {
        return;
      }
      print(imgFile.uri);
      img.Image image       = img.decodeImage(imgFile.readAsBytesSync());
      img.Image Smallerimg  = img.copyResize(image,width: 500);
      imgFile.writeAsBytesSync(img.encodeJpg(image,quality: 85));
      setState(() {
       imgFile = imgFile; 
       
      });
      //var compressImage     = File(path);
    }

    Future upload(File imageFile) async{
      var stream        = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length        = await imageFile.length();
      var uri           = Uri.parse("http://haryel.tecnicosenac.tk/add-produto.php");

      var request       = http.MultipartRequest("POST",uri);
      var multipartFile = http.MultipartFile("imagem_item",stream,length, filename: basename(imageFile.path));

      request.fields['nome_item']       = nomeController.text;
      request.fields['preco_item']      = precoController.text;
      request.fields['descricao_item']  = descricaoController.text;
      request.fields['pontuacao_item']  = pontuacaoController.text;

      request.files.add(multipartFile);

      var response = await request.send();
      print(response.statusCode);

      if(response.statusCode == 200){
        print("imagem upada");
      }else{
        print("falha no envio");
      }
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
                  keyboardType: TextInputType.text,
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

                RaisedButton(
                  onPressed: getImageCamera,
                  child: Text('  Tirar Foto  '),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    upload(imgFile);
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
