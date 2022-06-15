
import 'package:flutter/material.dart';
import 'package:simple_form_flutter/components/contatos/item.dart';
import 'package:simple_form_flutter/database/app_database.dart';
import 'package:simple_form_flutter/models/contato.dart';
import 'formulario.dart';


class ListaContatos extends StatefulWidget{

  const ListaContatos({Key? key}) : super(key: key);

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
        child: FutureBuilder(
          future: findAll() ,
          builder: (context, snapshot){

            switch(snapshot.connectionState){
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contato> contacts = snapshot.data as List<Contato>;

                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, indice) {
                    final Contato contato = contacts[indice];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                      child: ItemContato(contato),
                    );
                  },
                );
            }

            return const Center(child: Text('Unknown Error'));
          },
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const FormularioContato();
            })
          ).then((id) => setState(() { }));
        },
      ),
    );
  }
}