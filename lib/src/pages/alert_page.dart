import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          onPressed: () => _showAlert(context),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder()
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: ( context ) {
        return AlertDialog(
          title: Center(child: Text('Título')),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contendio de la caja de alerta'),
              FlutterLogo(size: 100,)
            ],
          ),          
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text('Cancelar')
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text('Aceptar'))
            ,
          ],
          // clipBehavior: Clip.antiAlias,
        );
      }
    );
  }
}