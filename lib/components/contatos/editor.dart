import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String rotulo;
  final String dica;
  final bool validate;
  final IconData? icon;
  final TextInputType? tipoInput;

  // ignore: use_key_in_widget_constructors
  const Editor({
    required this.controller,
    required this.rotulo,
    required this.dica,
    required this.validate,
    this.icon,
    this.tipoInput
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey.shade600, width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          icon: Icon(icon),
          labelText: rotulo,
          hintText: dica,
          errorText: validate ? 'Este campo não pode ser vazio' : null
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
        keyboardType: tipoInput ?? tipoInput 
      ),
    );
  }
}