void main() {
  /*15. Utilize um loop for para imprimir os primeiros 10 números da sequência de Fibonacci.*/
  
  int quantidade = 10;
  var fib = fibonacci(quantidade);
  
  print("Os ${quantidade} primeiros elementos da sequencia de fibonnaci são: ");
  
  String result = "";
  for(var n in fib){
    result += "${n},";
  }
  
  print(result);
}

List<int> fibonacci(int quantidade){
  
  List<int> fib = [1];
  
  if(quantidade == 1){
    return fib;
  }
  
  if(quantidade >= 2){
    fib.add(1);
  }
   
  
  for(int i = 2; i < quantidade; i++){
    var a0 = i - 2;
    var a1 = i - 1;
    int prox = fib[a0] + fib[a1];
    fib.add(prox);
  }
  
  return fib;
}
