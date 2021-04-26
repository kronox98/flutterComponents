import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Inputs'),
       ),
       body: ListView(
         padding: EdgeInsets.all(15.0),
         children: [
           _createInput(),
           Divider(),
           _createPerson()
         ],
       ),
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.none,
      maxLength: 100,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Este es el texto de ayuda',
        suffixIcon: Icon(Icons.person),
        prefixIcon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
          
        });
      },
    );
  }

  _createPerson() {

    return ListTile(
      title: Text('Nombre es: $_nombre')
    );
  }
}