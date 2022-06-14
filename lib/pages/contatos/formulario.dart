
import 'package:flutter/material.dart';
import 'package:simple_form_flutter/components/contatos/editor.dart';
import 'package:simple_form_flutter/models/contato.dart';


class FormularioContato extends StatefulWidget {
  const FormularioContato({ Key? key }) : super(key: key);

  @override
  State<FormularioContato> createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _controllerNomeContato = TextEditingController();
  final TextEditingController _controllerTelefone = TextEditingController();

  bool _validateNumConta = false;
  bool _validateValorTransf = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Novo contato'),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
      
            Editor(
              controller: _controllerNomeContato,
              rotulo: "Nome",
              dica: "Fulano",
              validate: _validateNumConta,
              icon: Icons.person
            ),
      
            Editor(
              controller: _controllerTelefone,
              rotulo: "Telefone",
              dica: "99 999999999",
              validate: _validateValorTransf,
              icon: Icons.phone,
              tipoInput: TextInputType.number,
            ),
      
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  child: const Text('SALVAR'),
                  onPressed: () => _criaContato(context),
                ),
              ),
            )
          ],
        ),
      )
    );
  }


  _criaContato(BuildContext context) {

    final String nomeContato = _controllerNomeContato.text; //int.tryParse(_controllerNomeContato.text); //Tenta converter para int se não retorna nulo
    final String telefone = _controllerTelefone.text;

    _retornaErroCamposVazios(nomeContato, telefone);

    if(_verificaCamposVazios(nomeContato, telefone)){
      final contatoCriado = Contato(telefone, nomeContato);
      Navigator.pop(context, contatoCriado);
    }
  }

  _retornaErroCamposVazios(nomeContato, telefone){
    setState(() {
      nomeContato != null && nomeContato != "" ? _validateNumConta = false : _validateNumConta = true;
      telefone != null && telefone != "" ? _validateValorTransf = false : _validateValorTransf = true;
    });
  }

  bool _verificaCamposVazios(nomeContato, telefone){
    return ((nomeContato != null && nomeContato != "") && telefone != null && telefone != "") ? true : false;
  }
}