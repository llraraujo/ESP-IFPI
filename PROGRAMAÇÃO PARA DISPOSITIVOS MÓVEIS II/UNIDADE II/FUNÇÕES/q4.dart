void main(List<String> args) {
  descreverCidade("Paris", "França");
  descreverCidade("Teresina");
  descreverCidade("Moscou","Rússia");
}

void descreverCidade(String cidade, [String pais = "Brasil"]){
  print("Cidade: ${cidade}, País: ${pais}");
}