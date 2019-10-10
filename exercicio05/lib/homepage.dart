import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String userUId = FirebaseAuth.instance
      .currentUser()
      .then((FirebaseUser user) => user.uid)
      .toString();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Estamos logados e prontos para achar Jhon Conor' +
                  userUID.toString()),
              SizedBox(
                height: 15.00,
              ),
              new OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 3.0),
                  child: Text('Logout'),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.of(context)
                          .pushReplacementNamed('/landingpage');
                    }).catchError((e) {
                      print('e');
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
