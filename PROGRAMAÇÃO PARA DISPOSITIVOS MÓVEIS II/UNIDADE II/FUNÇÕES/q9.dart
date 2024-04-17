void main(List<String> args) {
  Map<String, int> estoque = {
    "Playstation 5": 5000, 
    "Notebook Dell G15" : 7580, 
    "TV LG 52' 4K OLED": 8000,
    "Som LG 2500 Watts": 700
  };

  imprimirEstoque(estoque);
}

void imprimirEstoque(Map<String, int> estoque){
  for(var item in estoque.keys){
    print("Item: ${item}, Quantidade: ${estoque[item]}");
  }
}