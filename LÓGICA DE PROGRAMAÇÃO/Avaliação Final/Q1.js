
// Beecrowd: 1016
//PS: Copiar o código inteiro e colar na questão correspondente do Beecrowd

var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

var distancia = parseInt(lines);
var tempo = (distancia /(90 - 60) * 60);
console.log(tempo + " minutos");
