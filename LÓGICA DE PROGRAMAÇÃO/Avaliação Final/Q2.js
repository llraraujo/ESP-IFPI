// Beecrowd: 1020

var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

var dias = parseInt(lines);

var anos = parseInt(dias/365);

var meses = parseInt((dias%365)/30);

var dias = parseInt((dias%365)%30);

console.log(anos + " ano(s)");
console.log(meses + " mes(es)");
console.log(dias +  " dia(s)");