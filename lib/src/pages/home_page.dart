
import 'package:flutter/material.dart';
import 'package:components/src/utils/icons_string.dart';

import 'package:components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  final _color = Color.fromRGBO(214, 1, 1, 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
        centerTitle: true,
        backgroundColor: _color,
      ),
      body: _list(),
    );
  }

  _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context), 
        );
      },
    );
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context) {
    
    final List<Widget> options = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        // subtitle: Text(data),
        leading: getIcons(element['icon'], _color),
        trailing: Icon(Icons.keyboard_arrow_right, color: _color),
        onTap: () {         
          Navigator.pushNamed(context, element['ruta']);
        },        
      );
      options..add(widgetTemp)
             ..add(Divider());
    });        
    return options;
  }
}