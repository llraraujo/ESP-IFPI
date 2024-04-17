void main(List<String> args) {
  List<int> lista = [1, -11, 10, 99, 100, -99, 100, 101];
  var maior = maiorNumero(lista);

  print("O maior do número da Lista é ${maior}");
}

int maiorNumero(List<int> listaNumeros){
  listaNumeros.sort();
  return listaNumeros.last;
}