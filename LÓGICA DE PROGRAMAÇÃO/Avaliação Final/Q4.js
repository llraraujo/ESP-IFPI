//Beecrowd 1116
//PS: Copiar o código inteiro e colar na questão correspondente do Beecrowd

var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

var n = parseInt(lines[0]);

for(let i = 1; i <= n; i++){
    
    var numeros = lines[i].split(" ");
    var n1 = Number(numeros[0]);
    var n2 = Number(numeros[1]);
    if( n2 === 0){
        console.log("divisao impossivel")
    }
    else{
        const result = Number(n1 / n2);
        console.log(result.toFixed(1));
    }
}