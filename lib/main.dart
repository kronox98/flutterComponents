import 'package:flutter/material.dart'; 
import 'package:components/src/routes/routes.dart';
import 'package:components/src/pages/not_found_page.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: HomePage(),
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (settings) {
        print('Ruta llamada $settings');
        return MaterialPageRoute(builder: ( BuildContext context) => NotFoundPage());
      },
    );
  }
}