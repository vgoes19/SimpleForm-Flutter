
import 'package:flutter/material.dart';
import 'package:simple_form_flutter/pages/contatos/lista.dart';


void main() => runApp( const SimpleFormFlutter() );

class SimpleFormFlutter extends StatelessWidget {
  const SimpleFormFlutter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey[600],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[600]
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueGrey[300]
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.blueGrey[300]
            )
          )
        ),
      ),
      home: ListaContatos()
    );
  }
}
