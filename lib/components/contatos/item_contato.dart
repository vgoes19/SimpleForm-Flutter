import 'package:flutter/material.dart';
import 'package:simple_form_flutter/components/contatos/excluir_contato.dart';
import 'package:simple_form_flutter/models/contato.dart';


class ItemContato extends StatelessWidget {

  final Contato _contato;

  // ignore: use_key_in_widget_constructors
  const ItemContato(
    this._contato
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.person,
          size: 36,
          color: Color(0XFF97ace5),
        ),
        title: Text(_contato.nomeContato.toString()),
        subtitle: Text(_contato.telefone.toString()),
        trailing: ExcluirContato(nomeContato: _contato.nomeContato, id: _contato.id),
      ),
    );
  }
}

