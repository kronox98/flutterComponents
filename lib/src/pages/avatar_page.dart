import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.only( right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only( right: 15),
            child: CircleAvatar(
              child: Text('SA'),
              backgroundColor: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://i.pinimg.com/736x/67/27/34/672734ea65b7edf67535334c4d45837b.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 400),
          height: 700,
          fit: BoxFit.cover,

        ),
      ),
    );
  }
}