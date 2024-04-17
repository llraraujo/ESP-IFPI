void main(List<String> args) {
  int a = 2;
  int b = 5;
  var resultadoSoma = aplicarOperacao(a, b, soma);
  var resultadoSubtracao = aplicarOperacao(a, b, subtracao);
  var resultadoMultiplicacao = aplicarOperacao(a, b, multiplicacao);
  var resultadoDivisao = aplicarOperacao(a, b, divisao);

  print("Soma: ${a} + ${b} = ${resultadoSoma}");
  print("Subtracao: ${a} - ${b} = ${resultadoSubtracao}");
  print("Multiplicacao: ${a} * ${b} = ${resultadoMultiplicacao}");
  print("Divisao: ${a} / ${b} = ${resultadoDivisao}");
}

int aplicarOperacao(int n1, int n2, Function op){
  return op(n1, n2);
}

int soma(int n1, int n2){
  return n1 + n2;
}

int subtracao(int n1, int n2){
  return n1 - n2;
}

int multiplicacao(int n1, int n2){
  return n1 * n2;
}

int divisao(int n1, int n2){
  return  n1 ~/n2;
}