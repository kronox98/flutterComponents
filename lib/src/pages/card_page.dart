import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _cardType1(),
          SizedBox( height: 30.0),
          _cardType2()
        ]
      ),
    );
  }

  Widget _cardType1() {
    
    return Card(
      elevation: 10.4,
      // clipBehavior: Clip.,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ListTile(
            leading: Icon( Icons.photo_album ),
            title: Text('Titulo de la tarjeta', style: TextStyle(fontWeight: FontWeight.w700),),
            subtitle: Text('subtitulo de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {}, 
                child: Text('Cancelar')
              ),
              TextButton(
                onPressed: () {}, 
                child: Text('Aceptar')
              ),
            ]
          )
        ]
      ),
    );

  }

  _cardType2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // margin: EdgeInsets.all(5.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://images6.alphacoders.com/111/1110175.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://images6.alphacoders.com/111/1110175.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text('Descripción de la imagen en la tarjeta'),
          )
        ],
      ),
    );
    
    // return Container(
    //   child: card,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(15.0),
    //     color: Colors.red
    //   ),
    // );
  }
}