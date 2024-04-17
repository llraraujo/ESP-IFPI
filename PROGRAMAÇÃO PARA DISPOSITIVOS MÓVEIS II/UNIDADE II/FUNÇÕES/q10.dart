void main(List<String> args) {
  configurarUsuario("Lucas", idade: 28, email: "");
  configurarUsuario("Thais");
  configurarUsuario("Davi", idade: 31, email: "dvrteste@gmail.com");
}

void configurarUsuario(String nome , {int idade = 18, String? email}){
    if(email == null || email == ""){
        print("Nome: ${nome}, Idade: ${idade}");
    }
    else{
      print("Nome: ${nome}, Idade: ${idade}, Email: ${email}");
    }
}