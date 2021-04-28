import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  // SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _check = false;
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImg()),
          ]
        ),
      ),
    );
  }

  _createSlider() {

    return Slider(
      label: 'Tamaño de la imagen',
      activeColor: Colors.indigo,
      // divisions: 20,
      value: _valorSlider, 
      min: 0,
      max: 500.0,
      
      onChanged: (_check || _switch)? null : (value) {
        print(value);
        setState(() {
          _valorSlider = value;
        });
      },
    );
  }

  Widget _createImg() {
    return Image(
      image: NetworkImage('https://i.pinimg.com/originals/1f/ec/bc/1fecbc71d69f1bc2c22476a32b21d7de.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  _createCheckBox() {
    // return Checkbox(
    //   value: _check,
    //   onChanged: (value) {
    //     setState(() {
    //       _check = value;
    //     });
    //   },
    // );
    
    return CheckboxListTile(
      value: _check, 
      title: Text('Bloquear slider'),
      onChanged: (value) {
        setState(() {
          _check = value;
        });
      }
    );
  }

  _createSwitch() {
    return SwitchListTile(
      value: _switch, 
      title: Text('Bloquear slider'),
      onChanged: (value) {
        setState(() {
          _switch = value;
        });
      }
    );
  }
}