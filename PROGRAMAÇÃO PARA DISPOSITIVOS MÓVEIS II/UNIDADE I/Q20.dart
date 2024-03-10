void main() {
  
  /*20. Declare uma const chamada taxaDeConversao e use-a para converter um valor de dólares para reais, considerando que 1 dólar vale 5.23 reais. Imprima o resultado.*/
  
  const double taxaDeConversao = 5.23;
  
  double valorEmDolar = 5.00;
  
  double valorEmReais = valorEmDolar * taxaDeConversao;
  
  print("U\$ ${valorEmDolar.toStringAsFixed(2)} equivale a R\$ ${valorEmReais.toStringAsFixed(2)}".replaceAll(".",",") + ".");
 
  
}
