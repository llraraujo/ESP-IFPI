void main(){
  String nome = "Lucas";
  String sobreNome = "Rêgo Araújo";
  String nomeCompleto = construirNomeCompleto(nome: nome, sobreNome: sobreNome);
  String nomeSemSobrenome = construirNomeCompleto(nome: nome);
  print("Nome Completo: " + nomeCompleto);
  print("Nome: " + nomeSemSobrenome);
}

String construirNomeCompleto({required String nome, String sobreNome = ""}){
  return "${nome} ${sobreNome}";
}