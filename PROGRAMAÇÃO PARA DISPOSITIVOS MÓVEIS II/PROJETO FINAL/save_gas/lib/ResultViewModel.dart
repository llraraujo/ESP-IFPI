class ResultViewModel{

  final double totalLitrosGasolina;
  final double totalLitrosAlcool;
  final double custoTotalGasolina;
  final double custoTotalAlcool;
  final String destino;
  final double distancia;
  final double saldo;

  const ResultViewModel({
    required this.totalLitrosGasolina,
    required this.totalLitrosAlcool,
    required this.custoTotalGasolina,
    required this.custoTotalAlcool,
    required this.destino,
    required this.distancia,
    required this.saldo
  });

  String resultado(){
    
    String mensagem = "";
    double trocoGasolina = saldo - custoTotalGasolina;
    double trocoAlcool = saldo - custoTotalAlcool; 

    if(saldo >= custoTotalGasolina && saldo >= custoTotalAlcool){     
        mensagem = "O seu saldo é suficiente para cobrir os gastos de ambos os combustíveis.\n";
        mensagem += "Troco de R\$ ${trocoGasolina.toStringAsFixed(2)} caso abasteça com Gasolina.\n";
        mensagem += "Troco de R\$ ${trocoAlcool.toStringAsFixed(2)} caso abasteça com Álcool.\n";
        return mensagem;
    }
    if(saldo >= custoTotalGasolina && saldo < custoTotalAlcool){      
        mensagem = "O seu saldo é suficiente para cobrir apenas os gastos da Gasolina.\n";
        mensagem += "Troco de R\$ ${trocoGasolina.toStringAsFixed(2)} caso abasteça com Gasolina.\n";
        mensagem += "Déficit de R\$ ${trocoAlcool.toStringAsFixed(2)} caso abasteça com Álcool.\n";
        return mensagem;
    }
    if(saldo < custoTotalGasolina && saldo >= custoTotalAlcool){    
        mensagem = "O seu saldo é suficiente para cobrir apenas os gastos do Álcool .\n";
        mensagem += "Troco de R\$ ${trocoAlcool.toStringAsFixed(2)} caso abasteça com Álcool.\n";
        mensagem += "Déficit de R\$ ${trocoGasolina.toStringAsFixed(2)} caso abasteça com Gasolina.\n";
        return mensagem;
    }

    mensagem = "O seu saldo não é suficiente para cobrir os gastos dos combustíveis.\n";
    mensagem += "Você precisa completar com: R\$ ${(-1*trocoGasolina).toStringAsFixed(2)} para Gasolina.\n";
    mensagem += "Você precisa completar com: R\$ ${(-1*trocoAlcool).toStringAsFixed(2)} para Álcool.\n";

    return mensagem;
  }

} 