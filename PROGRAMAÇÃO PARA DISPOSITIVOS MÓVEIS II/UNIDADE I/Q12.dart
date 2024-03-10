void main() {
  
  /*12. Declare uma variável const chamada maxIdade com valor 100 e use-a para verificar se idade é menor que maxIdade.*/
  
  const maxIdade = 100;
  
  int idade = 101;
  
  if(idade < maxIdade){
    print("${idade} anos de idade é menor que ${maxIdade} anos.");
  }
  else if(idade == maxIdade){
    print("${idade} anos de idade é igual a ${maxIdade} anos.");
  }
  else{
    print("${idade} anos de idade é maior ${maxIdade} anos.");
  }
}
