
import 'package:flutter/material.dart';
import 'package:simple_form_flutter/components/contatos/item.dart';
import 'package:simple_form_flutter/models/contato.dart';
import 'formulario.dart';


class ListaContatos extends StatefulWidget{
  final List<Contato> _contatos = [];

  ListaContatos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0XFFE5EBFD),
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: widget._contatos.length,
          itemBuilder: (context, indice) {
            final contato = widget._contatos[indice];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              child: ItemContato(contato),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioContato();
          }));
         
          future.then((contatoRecebido) => _atualizaListaContatos(contatoRecebido));
        },
      ),
    );
  }

  _atualizaListaContatos(contatoRecebido) {
   
    if(contatoRecebido != null){
      contatoRecebido as Contato;
      setState(() => widget._contatos.add(contatoRecebido));
    }
  }
}