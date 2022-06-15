import 'package:flutter/material.dart';
import 'package:simple_form_flutter/database/dao/contato_dao.dart';
import 'package:simple_form_flutter/pages/contatos/lista.dart';

class ExcluirContato extends StatelessWidget {
  final String nomeContato;
  final int id;
  
  const ExcluirContato({
    Key? key, 
    required this.nomeContato,
    required this.id
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ContatoDao _dao = ContatoDao();
    
    return GestureDetector(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Atenção'),
          content: Text('Deseja mesmo excluir o contato $nomeContato ?'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancelar'),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.redAccent
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      _dao.deleteContact(id),
                      Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute<void>(builder: (BuildContext context) => const ListaContatos()),
                        ModalRoute.withName('/'),
                      )
                    },
                    child: const Text('Sim'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      child: const Icon(
        Icons.delete,
        color: Colors.redAccent,
        size: 36,
      ),
    );
  }
}