import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedContainerPage extends StatefulWidget {
  // AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Animated Container')
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
          duration: Duration(milliseconds: 250),
          curve: Curves.decelerate,
          
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () => _changeContainer(),
      ),
    );
  }

  _changeContainer() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        0.8);

      _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble() );
    });
  }
}