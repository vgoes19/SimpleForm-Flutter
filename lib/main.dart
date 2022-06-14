
import 'package:flutter/material.dart';
import 'package:simple_form_flutter/pages/dashboard/dashboard.dart';


void main() => runApp( const SimpleFormFlutter() );

class SimpleFormFlutter extends StatelessWidget {
  const SimpleFormFlutter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0XFF97ace5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF97ace5)
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor:Color(0XFF97ace5)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0XFF97ace5)
            )
          )
        ),
      ),
      home: const Dashboard()
    );
  }
}
