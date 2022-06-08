
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
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (context, indice) {
          final contato = widget._contatos[indice];
          return ItemContato(contato);
        },
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