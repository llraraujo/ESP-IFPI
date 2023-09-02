// Beecrowd 1174
//PS: Copiar o código inteiro e colar na questão correspondente do Beecrowd

var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

var array = Array.from({length: 100});

for(let i = 0; i < array.length; i++){
    array[i] = Number(lines[i]);
}

for(let i = 0; i < array.length; i++){
    const elemento = array[i];
    if(elemento <= 10){
        console.log(`A[${i}] = ${elemento.toFixed(1)}`);
    }
}