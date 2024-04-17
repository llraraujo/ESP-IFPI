void main(){
  String nome = "Lucas";
  String sobreNome = "Rêgo Araújo";
  String nomeCompleto = construirNomeCompleto(nome, sobreNome);
  print(nomeCompleto);
}

String construirNomeCompleto(String nome, String sobreNome){
  return "${nome} ${sobreNome}";
}