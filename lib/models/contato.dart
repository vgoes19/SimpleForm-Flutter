class Contato{
  late final int id;
  late final String telefone;
  late final String nomeContato;

  Contato(
    this.id,
    this.telefone,
    this.nomeContato
  );

  String toString(){
    return 'Contato{id: $id, telefone: $telefone, nome: $nomeContato}';
  }
}