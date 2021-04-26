import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página no encontrada'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('404', style: TextStyle(fontSize: 24),),
            Text('Página no encontrada', style: TextStyle(fontSize: 20),)
          ],
        ),
      )
    );
  }
}