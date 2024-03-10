void main() {
  
  /*16. Declare uma lista de inteiros e use um loop for para somar todos os elementos da lista.*/
  
  var numeros = [10, 5, 78, 99, 120, 158, 33, 71, 121];
  
  int soma = 0;
  
  for(var numero in numeros){
    soma += numero;
  }
  
  print("A soma dos números da lista é igual a: ${soma}");
  
  
}
