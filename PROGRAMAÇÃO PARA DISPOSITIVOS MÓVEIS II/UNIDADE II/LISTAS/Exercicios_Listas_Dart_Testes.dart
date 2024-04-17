
void main() {
  // Questão 1
  var frutas = <String>[];
  frutas.addAll(["Maçã", "Banana", "Uva"]);
  print("Q1: ${frutas}");
  assert(frutas.length == 3);

  // Questão 2
  final numerosFixos = const [5, 10, 15];
  print("Q2: ${numerosFixos}");
  assert(numerosFixos.length == 3 && numerosFixos[2] == 15);

  // Questão 3
  var listaNomes = <String?>['Johnny Deep', null, 'John Doe'];
  print("Q3: ${listaNomes}");
  assert(listaNomes.contains(null) && listaNomes.length == 3);

  // Questão 4
  var lista = [1, 2, 3, 4, 5];
  lista.add(6);
  print("Q4 :${lista}");
  assert(lista.contains(6) && lista.length == 6);

  // Questão 5
  // Remova o segundo elemento de 'frutas'
  frutas.removeAt(1);
  print("Q5: ${frutas}");
  assert(frutas.length == 2);

  // Questão 6
  // Certifique-se de tratar a possibilidade de nulo
  if(listaNomes[2] != null){
    print("Q6: ${listaNomes[2]}");
  }
  assert(listaNomes[2] != null);

  // Questão 7
  // Insira 'Maria' na primeira posição
  listaNomes.insert(0, "Maria");
  print("Q7: ${listaNomes}");
  assert(listaNomes[0] == 'Maria');

  // Questão 8
  var l1 = [1, 2, 3];
  var l2 = [4, 5, 6];
  var numerosCombinados = [...l1, ...l2]; // Combine as listas aqui
  print("Q8: ${numerosCombinados}");
  assert(numerosCombinados.length == 6 && numerosCombinados[5] == 6);

  // Questão 9
  var dezPrimeirosNumeros = List.generate(10, (index) => index + 1);
  print("Q9: ${dezPrimeirosNumeros}");
  assert(dezPrimeirosNumeros.last == 10);

  // Questão 10
  var quadrados = List.generate(5, (index) => (index + 1)*(index + 1)); // Gere os quadrados aqui
  print("Q10: ${quadrados}");
  assert(quadrados.last == 25);

  // Questão 11
  var cincoZeros = List.filled(5, 0);
  print("Q11: ${cincoZeros}");
  assert(cincoZeros.every((e) => e == 0));

  // Questão 12
  var pares = dezPrimeirosNumeros.where((element) => (element % 2 == 0)).toList(); // Filtre `dezPrimeirosNumeros` para apenas números pares
  print("Q12: ${pares}");
  assert(pares.every((numero) => numero % 2 == 0) && pares.length == 5);

  // Questão 13
  var dobros = [1, 2, 3, 4, 5].map((e) => e * 2).toList(); // Crie uma lista de dobros aqui
  print("Q13: ${dobros}");
  assert(dobros.every((numero) => numero % 2 == 0) && dobros[0] == 2);

  // Questão 14
  var soma = [1, 2, 3, 4, 5].fold(0, (previousValue, element) => previousValue + element).toInt(); // Calcule a soma aqui
  print("Q14: ${soma}");
  assert(soma == 15);

  // Questão 15
  var temPar = [1, 3, 5, 7, 8, 11].any((e) => e % 2 == 0); // Verifique se há pelo menos um número par
  print("Q15: ${temPar}");
  assert(temPar);

  // Questão 16
  var todosPares = [2, 4, 6, 8, 10].every((element) => element % 2 == 0); // Verifique se todos os números são pares
  print("Q16: ${todosPares}");
  assert(todosPares);

  // Questão 17
  var listaNumeros = [...dezPrimeirosNumeros, ...dobros]; // Use o operador spread aqui
  print("Q17: ${listaNumeros}");
  assert(listaNumeros.length == 6);

  // Questão 18
  var listaUnidimensional = [[1,2], [3, 4]].expand((element) => element).toList(); // Use `expand` aqui
  print("Q18: ${listaUnidimensional}");
  assert(listaUnidimensional.length == 4 && listaUnidimensional[3] == 4);

  // Questão 19
  var listaSemNulos = [1, 2, 3, null, 11, 10, null, 25].where((element) => element != null).toList(); // Remova elementos nulos aqui
  print("Q19: ${listaSemNulos}");
  assert(listaSemNulos.every((e) => e != null));

  // Questão 20
  var listaNumeros2 = [10, 20, 30, 40, 50];
  listaNumeros2.insert(3, 35);
  // Insira o número 35 entre 30 e 40
  print("Q20: ${listaNumeros2}");
  assert(listaNumeros2[3] == 35);
}
