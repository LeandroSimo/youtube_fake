import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'telas/Explorar.dart';
import 'telas/Inicio.dart';
import 'telas/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      Biblioteca(),
      Explorar(),
      Inscricoes(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: 0.8,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          'lib/images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.cast),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              setState(() {
                _resultado = res;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Explorar",
            icon: Icon(Icons.explore_outlined),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.add_circle_outline_rounded,
              size: 45,
            ),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions_outlined),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.video_collection_outlined),
          ),
        ],
      ),
    );
  }
}
