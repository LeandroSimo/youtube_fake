import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = List();
    if (query.isNotEmpty) {
      lista = [
        "Missa",
        "missa",
        "oração",
        "Oração",
        "Dynamus",
      ]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }
  }
}
