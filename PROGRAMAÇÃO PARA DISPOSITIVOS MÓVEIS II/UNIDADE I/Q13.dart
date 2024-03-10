void main() {
  
  /*13. Crie uma função que receba um número e retorne o fatorial desse número.*/
  
  int num = 7;
  
  int fat = fatorial(num);
  
  print("O fatorial de ${num} é igual a ${fat}");
  
}

int fatorial(int n){
    
    if(n == 0){
      return 1;
    }
    
    return n*fatorial(n - 1);
}