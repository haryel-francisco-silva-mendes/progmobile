import 'package:aula_06/add-page.dart';
import 'package:aula_06/jsom_produto.dart';
import 'package:flutter/material.dart';

class Painel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("painel do ademir"),
      ),

        
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('adicionar'),
              leading: Icon(Icons.add),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (BuildContext context) => AddData()),
                );
              },
            ),
            ListTile(
              title: Text('listar'),
              leading: Icon(Icons.visibility),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => Produto()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
